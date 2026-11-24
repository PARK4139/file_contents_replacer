/**
 * file_contents_replacer - Core Logic Engine (Node.js)
 * 
 * [file_contents_replacer] 레이블 전용 파서 및 치환기
 * - 규칙 파일 내에서 [file_contents_replacer] 레이블 블록을 찾아서 해당 구간만 작업
 * - 규칙 파일이 없으면 자동 생성이 아닌 등록(선택)을 받음
 * - 등록 시 파일 내에 [file_contents_replacer] 레이블이 없으면 최상단에 생성
 * - '#'으로 시작하는 행은 주석으로 무시
 * - 규칙 포맷: [찾을단어][치환할단어]
 * - word 어절 수('_'도 띄어쓰기 취급)가 긴 것을 상단으로 순번 재정렬
 * - 해당 구간만 갱신 저장 (파일의 다른 구간은 100% 원본 보존)
 * - 대상 파일에 대해 단일 패스 안전 일괄 치환 실행
 */

const fs = require('fs');
const path = require('path');

const SECTION_DIVIDER = '_______________________________________________________________';
const SECTION_LABEL = '[file_contents_replacer]';

/**
 * 단일 대괄호 [단어] 입력 시 자동으로 [단어][snake_case] 변환
 * 예: "SW Test Procedure" -> "sw_test_procedure"
 */
function autoGenerateReplacement(word) {
  if (typeof word !== 'string') word = String(word || '');
  return word
    .trim()
    .toLowerCase()
    .replace(/[\s\-_]+/g, '_')
    .replace(/^_+|_+$/g, '');
}

/**
 * 어절 수 및 글자 수 계산
 * - '_'도 띄어쓰기로 취급
 */
function calculateWordStats(word) {
  if (typeof word !== 'string') {
    word = String(word || '');
  }
  const normalized = word.replace(/_/g, ' ').trim();
  const segments = normalized ? normalized.split(/\s+/) : [];
  return {
    wordCount: segments.length,
    charLength: word.length,
    normalizedText: normalized,
    segments: segments
  };
}

/**
 * [file_contents_replacer] 레이블 블록 파싱
 * 
 * 반환값:
 * {
 *   hasLabel: boolean,
 *   blockStartIdx: number,
 *   blockEndIdx: number,
 *   headerIdx: number,
 *   rules: Array,
 *   comments: Array,
 *   lines: Array
 * }
 */
function parseReplacerSection(content) {
  const lines = content.split(/\r?\n/);
  let headerIdx = -1;

  for (let i = 0; i < lines.length; i++) {
    if (lines[i].trim() === SECTION_LABEL) {
      headerIdx = i;
      break;
    }
  }

  if (headerIdx === -1) {
    return {
      hasLabel: false,
      blockStartIdx: -1,
      blockEndIdx: -1,
      headerIdx: -1,
      rules: [],
      comments: [],
      lines: lines
    };
  }

  // 블록 시작 인덱스 (헤더 윗줄이 구분선이면 구분선부터)
  let blockStartIdx = headerIdx;
  if (headerIdx > 0 && lines[headerIdx - 1].trim().startsWith('_____')) {
    blockStartIdx = headerIdx - 1;
  }

  // 블록 끝 인덱스 탐색
  let blockEndIdx = lines.length - 1;
  let closingDividerIdx = -1;

  for (let i = headerIdx + 1; i < lines.length; i++) {
    const trimmed = lines[i].trim();
    if (trimmed.startsWith('_____')) {
      closingDividerIdx = i;
      blockEndIdx = i;
      break;
    }
    // 다른 섹션 헤더 (> 로 시작하는 제목)를 만난 경우
    if (trimmed.startsWith('>')) {
      blockEndIdx = i - 1;
      break;
    }
  }

  const rules = [];
  const comments = [];
  const scanEnd = (closingDividerIdx !== -1) ? closingDividerIdx : blockEndIdx + 1;

  for (let i = headerIdx + 1; i < scanEnd; i++) {
    const rawLine = lines[i];
    const trimmed = rawLine.trim();

    if (!trimmed) continue;

    // # 으로 시작하는 주석 행 무시
    if (trimmed.startsWith('#')) {
      comments.push({ lineIndex: i, text: rawLine });
      continue;
    }

    // 1) [find][replace] 형식 파싱
    const matchTwo = trimmed.match(/^\[(.*?)\]\s*\[(.*?)\]$/);
    if (matchTwo) {
      const findWord = matchTwo[1];
      const replaceWord = matchTwo[2];
      const stats = calculateWordStats(findWord);
      rules.push({
        rawLine: rawLine,
        lineIndex: i,
        word: findWord,
        replace: replaceWord,
        wordCount: stats.wordCount,
        charLength: stats.charLength,
        wasSingle: false
      });
      continue;
    }

    // 2) [find] 단일 괄호 형식 파싱 (섹션 헤더 제외) -> [find][snake_case]로 자동 변환!
    const matchSingle = trimmed.match(/^\[(.*?)\]$/);
    if (matchSingle && trimmed !== SECTION_LABEL) {
      const findWord = matchSingle[1].trim();
      const autoReplace = autoGenerateReplacement(findWord);
      const stats = calculateWordStats(findWord);
      rules.push({
        rawLine: rawLine,
        lineIndex: i,
        word: findWord,
        replace: autoReplace,
        wordCount: stats.wordCount,
        charLength: stats.charLength,
        wasSingle: true
      });
    }
  }

  return {
    hasLabel: true,
    blockStartIdx,
    blockEndIdx,
    headerIdx,
    closingDividerIdx,
    rules,
    comments,
    lines
  };
}

/**
 * 규칙 파일 등록 및 레이블 최상단 생성
 * - 파일이 존재하지 않으면 에러
 * - [file_contents_replacer] 레이블이 없으면 최상단에 생성
 */
function registerRuleFile(filePath) {
  const fullPath = path.resolve(filePath);
  if (!fs.existsSync(fullPath)) {
    throw new Error(`등록할 파일을 찾을 수 없습니다: ${fullPath}`);
  }

  const content = fs.readFileSync(fullPath, 'utf8');
  const parsed = parseReplacerSection(content);

  if (!parsed.hasLabel) {
    // 최상단에 레이블 블록 생성
    const templateBlock = [
      SECTION_DIVIDER,
      SECTION_LABEL,
      '[SW Test Plan][sw_test_plan]',
      '# [무시됩니다.][변경되었습니다]',
      SECTION_DIVIDER,
      ''
    ].join('\r\n');

    const newContent = templateBlock + (content.startsWith('\r\n') || content.startsWith('\n') ? content : '\r\n' + content);
    
    // 원본 백업
    const backupPath = `${fullPath}.bak_reg`;
    if (!fs.existsSync(backupPath)) {
      fs.writeFileSync(backupPath, content, 'utf8');
    }

    fs.writeFileSync(fullPath, newContent, 'utf8');
    return {
      created: true,
      fullPath,
      message: `[file_contents_replacer] 레이블을 파일 최상단에 생성했습니다: ${fullPath}`
    };
  }

  return {
    created: false,
    fullPath,
    message: `기존 [file_contents_replacer] 레이블을 감지했습니다: ${fullPath}`
  };
}

/**
 * 규칙 목록 중복 제거 및 정렬
 * 1. 동일한 word 가 여러 번 나온 경우 1개로 통합 (명시적 치환어 우선)
 * 2. 1순위: 어절 수 내림차순
 * 3. 2순위: 글자 수 내림차순
 * 4. 3순위: 사전순
 */
function sortRules(rules) {
  // 중복 제거
  const uniqueMap = new Map();
  for (const r of rules) {
    const key = r.word;
    if (!uniqueMap.has(key)) {
      uniqueMap.set(key, r);
    } else {
      // 이미 등록된 항목이 자동 생성이었고 새 항목이 명시적 지정이면 교체
      if (uniqueMap.get(key).wasSingle && !r.wasSingle) {
        uniqueMap.set(key, r);
      }
    }
  }

  const deduped = Array.from(uniqueMap.values());

  const sorted = deduped.sort((a, b) => {
    if (b.wordCount !== a.wordCount) {
      return b.wordCount - a.wordCount;
    }
    if (b.charLength !== a.charLength) {
      return b.charLength - a.charLength;
    }
    return a.word.localeCompare(b.word);
  });

  return sorted.map((r, idx) => ({
    ...r,
    순번: idx + 1
  }));
}

/**
 * 규칙 파일의 [file_contents_replacer] 구간만 정렬하여 갱신 저장
 */
function updateRuleFileSection(filePath) {
  const fullPath = path.resolve(filePath);
  if (!fs.existsSync(fullPath)) {
    throw new Error(`파일을 찾을 수 없습니다: ${fullPath}`);
  }

  const content = fs.readFileSync(fullPath, 'utf8');
  let parsed = parseReplacerSection(content);

  if (!parsed.hasLabel) {
    // 레이블이 없으면 최상단에 등록 생성
    registerRuleFile(fullPath);
    const updatedContent = fs.readFileSync(fullPath, 'utf8');
    parsed = parseReplacerSection(updatedContent);
  }

  const sorted = sortRules(parsed.rules);

  // 구간 교체용 텍스트 생성
  const blockLines = [];
  blockLines.push(SECTION_DIVIDER);
  blockLines.push(SECTION_LABEL);
  
  // 긴 어절 순으로 정렬된 규칙들 기록
  for (const r of sorted) {
    blockLines.push(`[${r.word}][${r.replace}]`);
  }

  // 주석 행들 보존
  if (parsed.comments.length > 0) {
    for (const c of parsed.comments) {
      blockLines.push(c.text);
    }
  }

  blockLines.push(SECTION_DIVIDER);

  // 전체 파일 라인에서 [file_contents_replacer] 구간만 교체
  const eol = content.includes('\r\n') ? '\r\n' : '\n';
  const beforeLines = parsed.lines.slice(0, parsed.blockStartIdx);
  const afterLines = parsed.lines.slice(parsed.blockEndIdx + 1);

  const finalLines = [...beforeLines, ...blockLines, ...afterLines];
  let newContent = finalLines.join(eol);
  if ((content.endsWith('\r\n') || content.endsWith('\n')) && !newContent.endsWith(eol)) {
    newContent += eol;
  }

  // 백업 후 저장
  const backupPath = `${fullPath}.backup`;
  if (!fs.existsSync(backupPath)) {
    fs.writeFileSync(backupPath, content, 'utf8');
  }

  fs.writeFileSync(fullPath, newContent, 'utf8');

  return {
    fullPath,
    sortedRules: sorted,
    ruleCount: sorted.length
  };
}

/**
 * 본문 일괄 치환 실행 (단일 패스 정규식 매칭)
 * - 대상 파일 내 [file_contents_replacer] 레이블 섹션이 존재할 경우(규칙 파일과 대상 파일이 동일한 경우 등),
 *   해당 규칙 섹션 구간은 치환 대상에서 제외하고 100% 원본 그대로 보존합니다.
 */
function replaceFileContents(targetFilePath, sortedRules, options = {}) {
  const fullPath = path.resolve(targetFilePath);
  if (!fs.existsSync(fullPath)) {
    throw new Error(`치환 대상 파일을 찾을 수 없습니다: ${fullPath}`);
  }

  const validRules = sortedRules.filter(r => r.word && r.word.trim().length > 0);
  if (validRules.length === 0) {
    return {
      targetFilePath: fullPath,
      totalReplacements: 0,
      ruleStats: [],
      changed: false,
      sectionProtected: false
    };
  }

  const originalContent = fs.readFileSync(fullPath, 'utf8');
  const eol = originalContent.includes('\r\n') ? '\r\n' : '\n';
  
  // 백업 생성
  if (options.createBackup !== false) {
    const bakPath = `${fullPath}.bak`;
    fs.writeFileSync(bakPath, originalContent, 'utf8');
  }

  const escapeRegex = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const pattern = new RegExp(validRules.map(r => escapeRegex(r.word)).join('|'), 'g');

  const replaceMap = new Map();
  const countMap = new Map();

  for (const r of validRules) {
    replaceMap.set(r.word, r.replace !== undefined ? r.replace : '');
    countMap.set(r.word, 0);
  }

  let totalReplacements = 0;
  const doReplace = (text) => {
    return text.replace(pattern, (matched) => {
      countMap.set(matched, (countMap.get(matched) || 0) + 1);
      totalReplacements++;
      return replaceMap.get(matched);
    });
  };

  // 대상 파일 내 [file_contents_replacer] 레이블 섹션 탐색 (동일 파일이거나 레이블이 있는 경우 보호)
  const parsed = parseReplacerSection(originalContent);
  let currentContent;
  let sectionProtected = false;

  if (parsed.hasLabel) {
    sectionProtected = true;
    const lines = parsed.lines;
    const beforeLines = lines.slice(0, parsed.blockStartIdx);
    const sectionLines = lines.slice(parsed.blockStartIdx, parsed.blockEndIdx + 1);
    const afterLines = lines.slice(parsed.blockEndIdx + 1);

    const parts = [];
    if (beforeLines.length > 0) {
      parts.push(doReplace(beforeLines.join(eol)));
    }
    // [file_contents_replacer] 규칙 섹션은 치환하지 않고 100% 원본 그대로 보존
    parts.push(sectionLines.join(eol));
    if (afterLines.length > 0) {
      parts.push(doReplace(afterLines.join(eol)));
    }

    currentContent = parts.join(eol);
    if ((originalContent.endsWith('\r\n') || originalContent.endsWith('\n')) && !currentContent.endsWith(eol)) {
      currentContent += eol;
    }
  } else {
    currentContent = doReplace(originalContent);
  }

  const stats = validRules.map(r => ({
    순번: r.순번,
    word: r.word,
    replace: r.replace,
    count: countMap.get(r.word) || 0
  }));

  fs.writeFileSync(fullPath, currentContent, 'utf8');

  return {
    targetFilePath: fullPath,
    totalReplacements,
    ruleStats: stats,
    changed: originalContent !== currentContent,
    sectionProtected
  };
}

module.exports = {
  calculateWordStats,
  parseReplacerSection,
  registerRuleFile,
  sortRules,
  updateRuleFileSection,
  replaceFileContents
};

// CLI 직접 실행 시
if (require.main === module) {
  const readline = require('readline');

  async function getInteractiveInputs(questions) {
    if (!process.stdin.isTTY) {
      try {
        const piped = fs.readFileSync(0, 'utf8')
          .split(/\r?\n/)
          .map(s => s.trim().replace(/^["']|["']$/g, ''))
          .filter(Boolean);
        return piped;
      } catch (e) {
        return [];
      }
    }

    const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
    const ask = (q) => new Promise(res => rl.question(q, a => res((a || '').trim().replace(/^["']|["']$/g, ''))));
    const results = [];
    for (const q of questions) {
      results.push(await ask(q));
    }
    rl.close();
    return results;
  }

  async function main() {
    const args = process.argv.slice(2);
    let command = args[0];

    // 인자 없이 실행하거나 파일 경로를 바로 준 경우 대화형/치환 모드
    if (!command || !command.startsWith('--')) {
      if (command) {
        args.unshift('--replace');
        command = '--replace';
      } else {
        command = '--replace';
      }
    }

    try {
      if (command === '--register') {
        let file = args[1];
        if (!file) {
          const [ans] = await getInteractiveInputs(['등록할 규칙 파일 경로를 입력하세요: ']);
          file = ans;
        }
        if (!file) throw new Error('등록할 파일 경로가 입력되지 않았습니다.');
        const res = registerRuleFile(file);
        console.log(res.message);
      } else if (command === '--sort') {
        let file = args[1];
        if (!file) {
          const [ans] = await getInteractiveInputs(['정렬할 규칙 파일 경로를 입력하세요: ']);
          file = ans;
        }
        if (!file) throw new Error('규칙 파일 경로가 입력되지 않았습니다.');
        const res = updateRuleFileSection(file);
        console.log(`[성공] ${res.fullPath} 내 [file_contents_replacer] 구간 정렬 완료 (총 ${res.ruleCount}개 규칙)`);
        console.table(res.sortedRules.map(r => ({
          순번: r.순번,
          word: r.word,
          어절수: r.wordCount,
          글자수: r.charLength,
          replace: r.replace
        })));
      } else if (command === '--replace') {
        let ruleFile = args[1];
        let targetFile = args[2];

        if (!ruleFile || !targetFile) {
          const questions = [];
          if (!ruleFile) questions.push('규칙 파일 경로를 입력하세요: ');
          if (!targetFile) questions.push('치환을 적용할 대상 파일 경로를 입력하세요: ');
          const answers = await getInteractiveInputs(questions);
          let ansIdx = 0;
          if (!ruleFile) ruleFile = answers[ansIdx++];
          if (!targetFile) targetFile = answers[ansIdx++];
        }

        if (!ruleFile) throw new Error('규칙 파일 경로가 지정되지 않았습니다.');
        if (!targetFile) throw new Error('치환 대상 파일 경로가 지정되지 않았습니다.');

        const isSameFile = path.resolve(ruleFile) === path.resolve(targetFile);
        if (isSameFile) {
          console.log('[알림] 규칙 파일과 대상 파일이 동일합니다.');
          console.log('       [file_contents_replacer] 규칙 섹션은 안전하게 보호(치환 제외)되고, 그 외 본문만 치환됩니다.');
        }

        const sortRes = updateRuleFileSection(ruleFile);
        const replRes = replaceFileContents(targetFile, sortRes.sortedRules);
        console.log(`[치환 완료] 대상 파일: ${replRes.targetFilePath}`);
        if (replRes.sectionProtected) {
          console.log('[보호 완료] 대상 파일 내 [file_contents_replacer] 규칙 섹션이 치환에서 안전하게 제외(보존)되었습니다.');
        }
        console.log(`총 치환 횟수: ${replRes.totalReplacements}회`);
        console.table(replRes.ruleStats.filter(s => s.count > 0));
      } else if (command === '--help') {
        console.log('사용법:');
        console.log('  node replacer.cjs                                  (대화형으로 파일 입력받아 치환)');
        console.log('  node replacer.cjs --register <규칙파일>            (파일 등록 및 최상단 레이블 생성)');
        console.log('  node replacer.cjs --sort <규칙파일>                (규칙 파일 정렬)');
        console.log('  node replacer.cjs --replace <규칙파일> <대상파일>  (지정 파일 치환)');
      } else {
        throw new Error(`알 수 없는 명령어: ${command}`);
      }
    } catch (err) {
      console.error('[오류]', err.message);
      process.exit(1);
    }
  }

  main();
}
