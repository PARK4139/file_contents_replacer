# 파일본문 일괄단어 치환기 [file_contents_replacer]

사용자가 지정한 문서 내의 `[file_contents_replacer]` 레이블 구간만 읽어, **word 어절이 긴 규칙부터 순번을 매겨 파일 본문을 일괄 치환**하는 도구입니다.

---

## 🎯 주요 특징

1. **`[file_contents_replacer]` 레이블 구간 격리 및 안전 치환**:
   - 파일 전체 중 오직 `[file_contents_replacer]` 레이블이 있는 구간의 규칙만 찾아 작업합니다.
   - **규칙 파일과 대상 파일이 동일한 경우 완벽 보호**:
     - 규칙 파일과 대상 파일이 동일하거나 대상 파일 내에 `[file_contents_replacer]` 섹션이 포함된 경우, **해당 레이블 규칙 구간은 치환 대상에서 자동으로 제외(100% 원본 보존)**되고 그 외 본문 영역만 안전하게 일괄 치환됩니다.
2. **규칙 포맷, 주석 무시 및 자동 변환**:
   - 치환 규칙 기본 형식: `[찾을단어][치환단어]`
   - **단일 대괄호 자동 변환**: 섹션 내에 `[SW Test Procedure]`처럼 단일 대괄호만 한 줄에 적혀 있는 경우, 자동으로 소문자 snake_case로 변환되어 **`[SW Test Procedure][sw_test_procedure]`**로 자동 완성 및 파일에 갱신 저장됩니다.
   - **대괄호 없는 한 줄도 지원**: 규칙 섹션 안의 `Technical Review`는 `[Technical Review]`와 동일하게 취급하며, 실행 시 `[Technical Review][technical_review]`로 저장됩니다. 섹션 밖의 일반 본문은 규칙으로 등록하지 않습니다.
   - **치환 결과 편집용 규칙 추가**: 공백이 있는 용어를 자동 snake_case로 치환하면 `[테스트 피라미드][테스트_피라미드]`와 함께 `[테스트_피라미드][테스트_피라미드]`도 추가합니다. 두 번째 대괄호를 원하는 값으로 수정할 수 있으며, 이미 등록된 규칙은 유지하고 중복 생성하지 않습니다. 치환은 단일 패스이므로 수정한 규칙은 원문에 이미 있는 `테스트_피라미드`에 적용되고, 같은 실행에서 새로 변환한 결과에 연쇄 적용하지 않습니다.
   - `#`으로 시작하는 행은 **주석으로 완전히 무시**됩니다:
     ```text
     _______________________________________________________________ 
     [file_contents_replacer]
     [SW Test Plan][sw_test_plan] 
     [SW Test Procedure]
     # [무시됩니다.][변경되었습니다]
     _______________________________________________________________
     ```
   - 예시 주석 `# [무시됩니다.][변경되었습니다]`은 규칙 블록을 처음 생성할 때만 추가합니다. 이후 삭제해도 치환 실행 시 다시 추가하지 않습니다.
   - GUI에서 규칙 블록을 처음 생성하면 작업을 막지 않는 안내 창이 표시되고 10초 후 자동으로 닫힙니다.
3. **긴 어절 우선 순번 정렬**:
   - `$REG$`가 포함된 패턴 규칙은 일반 규칙 아래에 배치하고 마지막 순번을 부여합니다.
   - 원본 규칙과 자동 추가한 편집용 규칙은 한 묶음으로 정렬하여 바로 이어지는 순번을 부여합니다. 편집용 규칙의 치환 값을 수정해도 원본 바로 다음에 유지됩니다. 여러 원본이 같은 편집용 규칙을 공유하면 정렬상 첫 원본 뒤에 한 번만 배치합니다.
   - 밑줄(`_`)도 띄어쓰기로 취급하여 어절 수를 계산합니다.
   - **어절 수가 긴 것 ➔ 글자 수가 긴 것** 순서로 순번을 자동 재정렬하여 치환 누락/오염을 방지합니다.
4. **미니멀 & 직관적인 원클릭 GUI**:
   - 불필요한 시작 팝업 폭탄을 모두 제거하고, **규칙 파일 경로**와 **대상 파일 경로**만 직관적으로 입력받는 깔끔한 창을 제공합니다.
   - 탐색기에서 창으로 **드래그 앤 드롭(Drag & Drop)** 지원.
   - **동일 파일 체크박스**: 규칙과 대상이 같은 파일일 경우 원클릭으로 지정 가능.
   - 백업(`.bak`) 자동 생성 옵션 기본 제공.
   - 모든 체크 옵션(동일 파일 적용, 백업 자동 생성)은 실행 시 기본으로 켜집니다.
   - 두 경로는 최근 30개까지 드롭다운 이력으로 보관하며, 치환 실행 또는 창을 닫을 때 `path-history.json`에 저장합니다. 다음 실행 시 직전 경로를 불러옵니다.
   - 동일 파일 옵션이 켜져 있으면 대상 경로는 규칙 경로를 따릅니다. 옵션을 해제하면 별도로 입력했던 대상 경로가 복원됩니다.

---

## 🚀 실행 방법

### 중복 용어 축약 규칙

새 규칙 블록에는 다음 설명과 규칙이 주석으로 생성됩니다. 사용하려면 마지막 줄의 맨 앞 `#`만 지우세요.

```text
# 중복 용어 축약: 아래 규칙의 맨 앞 #을 지우면 활성화됩니다.
# 예: stakeholder(stakeholder) -> stakeholder / 테스트(테스트) -> 테스트
# 괄호 안팎이 다른 테스트(test)는 유지합니다. 용어는 문자, 숫자, _, -를 지원합니다.
# [$REG$($REG$)][$REG$]
```

활성화한 규칙: `[$REG$($REG$)][$REG$]`

`$REG$`는 이 규칙 전용 변수이며, 괄호 안팎의 용어가 대소문자까지 정확히 같을 때 하나로 줄입니다. 공백이 포함된 구문과 중첩 괄호는 지원하지 않습니다. 일반 치환 규칙과 함께 사용하며, 같은 위치에서는 중복 용어 규칙을 우선 적용하고 결과를 다시 치환하지 않습니다. 규칙 블록 자체는 치환에서 보호됩니다.

기존 규칙 블록에는 자동으로 삽입하지 않으므로 위 예시를 직접 붙여 넣으세요. 생성된 예시를 삭제해도 다시 추가하지 않습니다.

### 방법 1. 원클릭 실행 (추천)
폴더 내의 **`run.cmd`** 파일을 더블클릭합니다.
- Windows 환경에서 별도 설정 없이 즉시 경량 네이티브 GUI 창이 열립니다.

### 방법 2. PowerShell 직접 실행
```powershell
powershell -ExecutionPolicy Bypass -File .\file_contents_replacer.ps1
```

### 방법 3. Node.js CLI 실행 (배치 모드)
```bash
# 파일 등록 (레이블 없으면 최상단에 자동 생성)
node replacer.cjs --register ..\local_backlog.md

# 긴 어절 순번 정렬만 수행
node replacer.cjs --sort ..\local_backlog.md

# 치환 실행
node replacer.cjs --replace ..\local_backlog.md sample_target.txt
```

---

## 📁 파일 구조

- [run.cmd](file:///C:/Users/Huvitz/Downloads/CavemanDrive/backlog/file_contents_replacer/run.cmd): 실행 스크립트
- [file_contents_replacer.ps1](file:///C:/Users/Huvitz/Downloads/CavemanDrive/backlog/file_contents_replacer/file_contents_replacer.ps1): 미니멀 WinForms GUI 프로그램
- [replacer.cjs](file:///C:/Users/Huvitz/Downloads/CavemanDrive/backlog/file_contents_replacer/replacer.cjs): 치환 및 파서 코어 엔진
- [sample_target.txt](file:///C:/Users/Huvitz/Downloads/CavemanDrive/backlog/file_contents_replacer/sample_target.txt): 치환 테스트용 샘플 대상 문서
- [README.md](file:///C:/Users/Huvitz/Downloads/CavemanDrive/backlog/file_contents_replacer/README.md): 설명서
