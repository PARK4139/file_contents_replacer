param (
    [string]$RuleFile = "",
    [string]$TargetFile = ""
)

# ==============================================================================
# 파일본문 일괄단어 치환기 (File Contents Batch Word Replacer)
# 
# 기능 명세:
# 1. 실행 -> 직전 경로를 복원하고 경로 이력에서 선택 또는 직접 입력받음
# 2. 규칙 파일이 없으면 자동 생성이 아닌 등록(선택)을 받음
# 3. 등록 시 파일에 [file_contents_replacer] 레이블이 없으면 파일 최상단에 레이블 생성:
#    _______________________________________________________________ 
#    [file_contents_replacer]
#    [SW Test Plan][sw_test_plan] 
#    # [무시됩니다.][변경되었습니다]
#    _______________________________________________________________
# 4. [file_contents_replacer] 레이블 구간만 찾아서 파싱 (# 주석 행은 무시)
# 5. [찾을단어][치환단어] 에서 word 어절이 긴 것(_도 띄어쓰기 취급)을 상단으로 순번 변경
# 6. 사용자에게 GUI로 적용할 파일의 경로와 해당 파일의 레이블대로 진행 여부 질의
# 7. if yes 진행, else 미진행
# ==============================================================================

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $ScriptDir) {
    $ScriptDir = Get-Location
}

$SECTION_DIVIDER = "_______________________________________________________________"
$SECTION_LABEL = "[file_contents_replacer]"

$script:HistoryPath = Join-Path $ScriptDir 'path-history.json'
$script:PathHistory = @{ RulePaths = @(); TargetPaths = @(); LastRule = ''; LastTarget = '' }
if (Test-Path -LiteralPath $script:HistoryPath) {
    try {
        $savedHistory = Get-Content -LiteralPath $script:HistoryPath -Raw -Encoding UTF8 | ConvertFrom-Json -ErrorAction Stop
        foreach ($key in @('RulePaths', 'TargetPaths', 'LastRule', 'LastTarget')) {
            if ($null -ne $savedHistory.$key) { $script:PathHistory[$key] = $savedHistory.$key }
        }
    } catch {
        Write-Warning "경로 이력을 읽지 못했습니다: $($_.Exception.Message)"
    }
}
if (-not $RuleFile) { $RuleFile = [string]$script:PathHistory.LastRule }
if (-not $TargetFile) { $TargetFile = [string]$script:PathHistory.LastTarget }

function Save-PathHistory {
    $script:PathHistory.LastRule = $txtRule.Text.Trim()
    $script:PathHistory.LastTarget = $txtTarget.Text.Trim()
    foreach ($entry in @(
        @{ Key = 'RulePaths'; Control = $txtRule },
        @{ Key = 'TargetPaths'; Control = $txtTarget }
    )) {
        $current = $entry.Control.Text.Trim()
        $paths = @(@($current) + @($script:PathHistory[$entry.Key]) |
            Where-Object { -not [string]::IsNullOrWhiteSpace($_) } |
            Select-Object -Unique -First 30)
        $script:PathHistory[$entry.Key] = $paths
        $entry.Control.Items.Clear()
        $entry.Control.Items.AddRange([object[]]$paths)
        $entry.Control.Text = $current
    }
    try {
        $script:PathHistory | ConvertTo-Json -Depth 3 |
            Set-Content -LiteralPath $script:HistoryPath -Encoding UTF8 -ErrorAction Stop
    } catch {
        $lblStatus.Text = "경로 이력 저장 실패: $($_.Exception.Message)"
        Write-Warning $lblStatus.Text
    }
}

# ------------------------------------------------------------------------------
# 함수: 단일 [단어] 입력 시 snake_case 자동 생성
# 예: "SW Test Procedure" -> "sw_test_procedure"
# ------------------------------------------------------------------------------
function Convert-ToAutoSnakeCase {
    param ([string]$Word)
    if ([string]::IsNullOrWhiteSpace($Word)) { return "" }
    $clean = $Word.Trim().ToLower()
    $snake = [regex]::Replace($clean, '[\s\-_]+', '_').Trim('_')
    return $snake
}

# ------------------------------------------------------------------------------
# 함수: 어절 수 및 글자 수 계산 ('_'도 띄어쓰기로 취급)
# ------------------------------------------------------------------------------
function Get-WordStats {
    param (
        [string]$Word
    )
    if ([string]::IsNullOrEmpty($Word)) {
        return [PSCustomObject]@{
            WordCount = 0
            CharLength = 0
            Normalized = ""
        }
    }
    $normalized = $Word.Replace('_', ' ').Trim()
    $segments = $normalized -split '\s+' | Where-Object { $_ -ne "" }
    return [PSCustomObject]@{
        WordCount = $segments.Count
        CharLength = $Word.Length
        Normalized = $normalized
    }
}

# ------------------------------------------------------------------------------
# 함수: [file_contents_replacer] 구간 파싱
# ------------------------------------------------------------------------------
function Parse-ReplacerSection {
    param (
        [string]$FilePath
    )

    if (-not (Test-Path $FilePath)) {
        throw "규칙 파일을 찾을 수 없습니다: $FilePath"
    }

    $lines = [System.IO.File]::ReadAllLines($FilePath, [System.Text.Encoding]::UTF8)
    $headerIdx = -1

    for ($i = 0; $i -lt $lines.Length; $i++) {
        if ($lines[$i].Trim() -eq $SECTION_LABEL) {
            $headerIdx = $i
            break
        }
    }

    if ($headerIdx -eq -1) {
        return @{
            HasLabel = $false
            Lines = $lines
            Rules = @()
            Comments = @()
        }
    }

    # 블록 시작 인덱스 (헤더 윗줄이 구분선이면 구분선부터)
    $blockStartIdx = $headerIdx
    if ($headerIdx -gt 0 -and $lines[$headerIdx - 1].Trim().StartsWith("_____")) {
        $blockStartIdx = $headerIdx - 1
    }

    # 블록 끝 인덱스 탐색
    $blockEndIdx = $lines.Length - 1
    $closingDividerIdx = -1

    for ($i = $headerIdx + 1; $i -lt $lines.Length; $i++) {
        $trimmed = $lines[$i].Trim()
        if ($trimmed.StartsWith("_____")) {
            $closingDividerIdx = $i
            $blockEndIdx = $i
            break
        }
        # 다른 섹션 헤더 (> 로 시작하는 제목)를 만난 경우
        if ($trimmed.StartsWith(">")) {
            $blockEndIdx = $i - 1
            break
        }
    }

    $rules = @()
    $comments = @()
    $scanEnd = if ($closingDividerIdx -ne -1) { $closingDividerIdx } else { $blockEndIdx + 1 }

    for ($i = $headerIdx + 1; $i -lt $scanEnd; $i++) {
        $rawLine = $lines[$i]
        $trimmed = $rawLine.Trim()

        if ([string]::IsNullOrWhiteSpace($trimmed)) { continue }

        # '#' 주석 행은 무시
        if ($trimmed.StartsWith("#")) {
            $comments += [PSCustomObject]@{ LineIndex = $i; Text = $rawLine }
            continue
        }

        # 1) [find][replace] 형식 파싱
        if ($trimmed -match '^\s*\[(.*?)\]\s*\[(.*?)\]\s*$') {
            $findWord = $Matches[1]
            $replaceWord = $Matches[2]
            $stats = Get-WordStats -Word $findWord
            $rules += [PSCustomObject]@{
                RawLine    = $rawLine
                LineIndex  = $i
                Word       = $findWord
                Replace    = $replaceWord
                WordCount  = $stats.WordCount
                CharLength = $stats.CharLength
                WasSingle  = $false
            }
            continue
        }

        # 2) [find] 단일 괄호 형식 파싱 (섹션 헤더 제외) -> [find][snake_case] 로 자동 변환!
        if ($trimmed -match '^\s*\[(.*?)\]\s*$' -and $trimmed -ne $SECTION_LABEL) {
            $findWord = $Matches[1].Trim()
            $autoReplace = Convert-ToAutoSnakeCase -Word $findWord
            $stats = Get-WordStats -Word $findWord
            $rules += [PSCustomObject]@{
                RawLine    = $rawLine
                LineIndex  = $i
                Word       = $findWord
                Replace    = $autoReplace
                WordCount  = $stats.WordCount
                CharLength = $stats.CharLength
                WasSingle  = $true
            }
        }
    }

    return @{
        HasLabel          = $true
        BlockStartIdx     = $blockStartIdx
        BlockEndIdx       = $blockEndIdx
        HeaderIdx         = $headerIdx
        ClosingDividerIdx = $closingDividerIdx
        Rules             = $rules
        Comments          = $comments
        Lines             = $lines
    }
}

# ------------------------------------------------------------------------------
# 함수: 규칙 파일 등록 및 최상단 레이블 생성
# ------------------------------------------------------------------------------
function Register-RuleFile {
    param (
        [string]$FilePath
    )

    if (-not (Test-Path $FilePath)) {
        throw "등록할 파일을 찾을 수 없습니다: $FilePath"
    }

    $parsed = Parse-ReplacerSection -FilePath $FilePath

    if (-not $parsed.HasLabel) {
        # 최상단에 레이블 블록 생성
        $template = @"
$SECTION_DIVIDER
$SECTION_LABEL
[SW Test Plan][sw_test_plan]
# [무시됩니다.][변경되었습니다]
$SECTION_DIVIDER

"@
        $original = [System.IO.File]::ReadAllText($FilePath, [System.Text.Encoding]::UTF8)
        $newContent = $template + $original

        # 백업
        $bakPath = "$FilePath.bak_reg"
        if (-not (Test-Path $bakPath)) {
            [System.IO.File]::WriteAllText($bakPath, $original, [System.Text.Encoding]::UTF8)
        }

        [System.IO.File]::WriteAllText($FilePath, $newContent, [System.Text.Encoding]::UTF8)
        if ($form -and $form.Visible) {
            Show-RuleCreatedNotice
        }
        return @{
            Created = $true
            Message = "파일 최상단에 [file_contents_replacer] 레이블 블록이 생성되었습니다."
        }
    }

    return @{
        Created = $false
        Message = "기존 [file_contents_replacer] 레이블 구간을 로드했습니다."
    }
}

# ------------------------------------------------------------------------------
# 함수: 규칙 정렬 및 해당 구간만 갱신 저장
# ------------------------------------------------------------------------------
function Sort-And-UpdateSection {
    param (
        [string]$FilePath
    )

    if (-not (Test-Path $FilePath)) {
        throw "규칙 파일을 찾을 수 없습니다: $FilePath"
    }

    $parsed = Parse-ReplacerSection -FilePath $FilePath
    if (-not $parsed.HasLabel) {
        Register-RuleFile -FilePath $FilePath | Out-Null
        $parsed = Parse-ReplacerSection -FilePath $FilePath
    }

    # 중복 제거 (동일한 대상 단어는 1개로 통합, 명시적 치환어가 지정된 규칙 우선)
    $uniqueMap = @{}
    foreach ($r in $parsed.Rules) {
        $key = $r.Word
        if (-not $uniqueMap.ContainsKey($key)) {
            $uniqueMap[$key] = $r
        } else {
            if ($uniqueMap[$key].WasSingle -and -not $r.WasSingle) {
                $uniqueMap[$key] = $r
            }
        }
    }
    $dedupedRules = @($uniqueMap.Values)

    # 어절 길이순 정렬: 1순위 어절수 내림차순, 2순위 글자수 내림차순, 3순위 단어 오름차순
    $sorted = $dedupedRules | Sort-Object -Property @{Expression = "WordCount"; Descending = $true },
                                                    @{Expression = "CharLength"; Descending = $true },
                                                    @{Expression = "Word"; Descending = $false }

    # 순번 재부여
    $finalRules = @()
    $seq = 1
    foreach ($r in $sorted) {
        $finalRules += [PSCustomObject]@{
            '순번'    = $seq
            '레이블'  = "RULE-$seq"
            'word'    = $r.Word
            'replace' = $r.Replace
            '어절수'  = $r.WordCount
            '글자수'  = $r.CharLength
            'WasSingle' = $r.WasSingle
        }
        $seq++
    }

    # 파일 내 [file_contents_replacer] 구간만 교체 텍스트 구성
    $blockLines = @()
    $blockLines += $SECTION_DIVIDER
    $blockLines += $SECTION_LABEL
    foreach ($r in $finalRules) {
        $blockLines += "[$($r.word)][$($r.replace)]"
    }

    # 주석 행 보존
    if ($parsed.Comments.Count -gt 0) {
        foreach ($c in $parsed.Comments) {
            $blockLines += $c.Text
        }
    }
    $blockLines += $SECTION_DIVIDER

    # 구간 외 다른 영역은 100% 원본 유지
    $rawText = [System.IO.File]::ReadAllText($FilePath, [System.Text.Encoding]::UTF8)
    $eol = if ($rawText.Contains("`r`n")) { "`r`n" } else { "`n" }

    $lines = $parsed.Lines
    $beforeLines = if ($parsed.BlockStartIdx -gt 0) { @($lines[0..($parsed.BlockStartIdx - 1)]) } else { @() }
    $afterLines = if ($parsed.BlockEndIdx -lt ($lines.Length - 1)) { @($lines[($parsed.BlockEndIdx + 1)..($lines.Length - 1)]) } else { @() }

    $allLines = @()
    if ($beforeLines.Count -gt 0) { $allLines += $beforeLines }
    $allLines += $blockLines
    if ($afterLines.Count -gt 0) { $allLines += $afterLines }

    $newContent = ($allLines -join $eol)
    if (($rawText.EndsWith("`r`n") -or $rawText.EndsWith("`n")) -and -not ($newContent.EndsWith("`r`n") -or $newContent.EndsWith("`n"))) {
        $newContent += $eol
    }

    try {
        [System.IO.File]::WriteAllText($FilePath, $newContent, [System.Text.Encoding]::UTF8)
    } catch {
        # 저장 실패 시에도 읽어들인 목록은 유지
    }

    return $finalRules
}

# ------------------------------------------------------------------------------
# 함수: 파일 본문 일괄 치환 실행 (단일 패스 정규식 매칭)
# - 대상 파일 내 [file_contents_replacer] 레이블 섹션이 존재할 경우(규칙 파일과 대상 파일이 동일한 경우 등),
#   해당 규칙 섹션 구간은 치환 대상에서 제외하고 100% 원본 그대로 보존합니다.
# ------------------------------------------------------------------------------
function Invoke-ContentReplacement {
    param (
        [string]$TargetFile,
        [array]$Rules,
        [bool]$CreateBackup = $true
    )

    if (-not (Test-Path $TargetFile)) {
        throw "치환 대상 파일을 찾을 수 없습니다: $TargetFile"
    }

    $originalContent = [System.IO.File]::ReadAllText($TargetFile, [System.Text.Encoding]::UTF8)
    $eol = if ($originalContent.Contains("`r`n")) { "`r`n" } else { "`n" }

    # 백업 생성
    if ($CreateBackup) {
        $bakPath = "$TargetFile.bak"
        [System.IO.File]::WriteAllText($bakPath, $originalContent, [System.Text.Encoding]::UTF8)
    }

    $validRules = $Rules | Where-Object { -not [string]::IsNullOrEmpty($_.word) }
    if ($validRules.Count -eq 0) {
        return @{
            TotalCount       = 0
            Stats            = @()
            Changed          = $false
            SectionProtected = $false
        }
    }

    # 긴 어절이 앞선 순서대로 단일 패스 정규식 생성
    $patternParts = @()
    $replaceLookup = @{}
    $countLookup = @{}

    foreach ($r in $validRules) {
        $escaped = [regex]::Escape($r.word)
        $patternParts += $escaped
        $replaceLookup[$r.word] = if ($null -ne $r.replace) { $r.replace } else { "" }
        $countLookup[$r.word] = 0
    }

    $combinedPattern = "(" + ($patternParts -join "|") + ")"
    $regex = [regex]::new($combinedPattern, [System.Text.RegularExpressions.RegexOptions]::None)

    $evaluator = [System.Text.RegularExpressions.MatchEvaluator] {
        param([System.Text.RegularExpressions.Match]$match)
        $matchedWord = $match.Value
        if ($countLookup.ContainsKey($matchedWord)) {
            $countLookup[$matchedWord] = $countLookup[$matchedWord] + 1
        }
        return $replaceLookup[$matchedWord]
    }

    # 대상 파일 내 [file_contents_replacer] 레이블 섹션 탐색 (동일 파일이거나 레이블이 있는 경우 보호)
    $parsedTarget = Parse-ReplacerSection -FilePath $TargetFile
    $sectionProtected = $false
    $newContent = ""

    if ($parsedTarget.HasLabel) {
        $sectionProtected = $true
        $lines = $parsedTarget.Lines
        $beforeLines = if ($parsedTarget.BlockStartIdx -gt 0) { @($lines[0..($parsedTarget.BlockStartIdx - 1)]) } else { @() }
        $sectionLines = @($lines[$parsedTarget.BlockStartIdx..$parsedTarget.BlockEndIdx])
        $afterLines = if ($parsedTarget.BlockEndIdx -lt ($lines.Length - 1)) { @($lines[($parsedTarget.BlockEndIdx + 1)..($lines.Length - 1)]) } else { @() }

        $parts = @()
        if ($beforeLines.Count -gt 0) {
            $beforeText = ($beforeLines -join $eol)
            $parts += $regex.Replace($beforeText, $evaluator)
        }
        
        # [file_contents_replacer] 규칙 섹션은 치환하지 않고 100% 원본 그대로 보존
        $parts += ($sectionLines -join $eol)

        if ($afterLines.Count -gt 0) {
            $afterText = ($afterLines -join $eol)
            $parts += $regex.Replace($afterText, $evaluator)
        }

        $newContent = $parts -join $eol
        if (($originalContent.EndsWith("`r`n") -or $originalContent.EndsWith("`n")) -and -not ($newContent.EndsWith("`r`n") -or $newContent.EndsWith("`n"))) {
            $newContent += $eol
        }
    } else {
        $newContent = $regex.Replace($originalContent, $evaluator)
    }

    $totalReplaced = 0
    foreach ($cnt in $countLookup.Values) {
        $totalReplaced += $cnt
    }

    # 파일 저장
    [System.IO.File]::WriteAllText($TargetFile, $newContent, [System.Text.Encoding]::UTF8)

    $stats = @()
    foreach ($r in $validRules) {
        $cnt = if ($countLookup.ContainsKey($r.word)) { $countLookup[$r.word] } else { 0 }
        $stats += [PSCustomObject]@{
            '순번'    = $r.'순번'
            'word'    = $r.word
            'replace' = $r.replace
            '치환수'  = $cnt
        }
    }

    return @{
        TotalCount       = $totalReplaced
        Stats            = $stats
        Changed          = ($originalContent -ne $newContent)
        BackupPath       = if ($CreateBackup) { "$TargetFile.bak" } else { $null }
        SectionProtected = $sectionProtected
    }
}


# ------------------------------------------------------------------------------
# 최초 규칙 블록 생성 알림 (입력을 막지 않고 10초 후 닫힘)
# ------------------------------------------------------------------------------
function Show-RuleCreatedNotice {
    $notice = New-Object System.Windows.Forms.Form
    $notice.Text = '규칙 예시 생성 안내'
    $notice.ClientSize = New-Object System.Drawing.Size(460, 110)
    $notice.StartPosition = 'CenterParent'
    $notice.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedToolWindow
    $notice.ShowInTaskbar = $false
    $notice.Font = New-Object System.Drawing.Font('Malgun Gothic', 9.5)
    $message = New-Object System.Windows.Forms.Label
    $message.Dock = [System.Windows.Forms.DockStyle]::Fill
    $message.Padding = New-Object System.Windows.Forms.Padding(12)
    $message.Text = "규칙 블록과 예시 주석을 처음 생성했습니다.`n# [무시됩니다.][변경되었습니다]`n이 안내는 10초 후 자동으로 닫힙니다."
    $notice.Controls.Add($message)
    $timer = New-Object System.Windows.Forms.Timer
    $timer.Interval = 10000
    $notice.Tag = $timer
    $timer.Add_Tick({ $notice.Close() }.GetNewClosure())
    $notice.Add_FormClosed({
        param($sender, $eventArgs)
        $sender.Tag.Stop()
        $sender.Tag.Dispose()
    })
    $notice.Show($form)
    $timer.Start()
}

# ------------------------------------------------------------------------------
# GUI 폼 구성 (WinForms - 미니멀 경로 입력형)
# ------------------------------------------------------------------------------
$form = New-Object System.Windows.Forms.Form
$form.Text = "파일본문 일괄 치환기 [file_contents_replacer]"
$form.Size = New-Object System.Drawing.Size(620, 270)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $true
$form.Font = New-Object System.Drawing.Font("Malgun Gothic", 9.5)
$form.BackColor = [System.Drawing.Color]::FromArgb(248, 249, 250)
$form.AllowDrop = $true

# 1. 규칙 파일 레이블 & 텍스트박스 & 찾아보기 버튼
$lblRule = New-Object System.Windows.Forms.Label
$lblRule.Text = "규칙 파일 경로 (Rule File):"
$lblRule.Location = New-Object System.Drawing.Point(20, 16)
$lblRule.AutoSize = $true
$form.Controls.Add($lblRule)

$txtRule = New-Object System.Windows.Forms.ComboBox
$txtRule.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDown
$txtRule.Items.AddRange([object[]]@($script:PathHistory.RulePaths))
$txtRule.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::SuggestAppend
$txtRule.AutoCompleteSource = [System.Windows.Forms.AutoCompleteSource]::ListItems
$txtRule.Location = New-Object System.Drawing.Point(22, 38)
$txtRule.Size = New-Object System.Drawing.Size(460, 25)
$txtRule.Text = if ($RuleFile) { $RuleFile } else { "" }
$txtRule.AllowDrop = $true
$form.Controls.Add($txtRule)

$btnBrowseRule = New-Object System.Windows.Forms.Button
$btnBrowseRule.Text = "찾아보기..."
$btnBrowseRule.Location = New-Object System.Drawing.Point(490, 36)
$btnBrowseRule.Size = New-Object System.Drawing.Size(95, 29)
$btnBrowseRule.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnBrowseRule.BackColor = [System.Drawing.Color]::FromArgb(241, 245, 249)
$form.Controls.Add($btnBrowseRule)

# 2. 대상 파일 레이블 & 텍스트박스 & 찾아보기 버튼
$lblTarget = New-Object System.Windows.Forms.Label
$lblTarget.Text = "대상 파일 경로 (Target File):"
$lblTarget.Location = New-Object System.Drawing.Point(20, 76)
$lblTarget.AutoSize = $true
$form.Controls.Add($lblTarget)

$txtTarget = New-Object System.Windows.Forms.ComboBox
$txtTarget.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDown
$txtTarget.Items.AddRange([object[]]@($script:PathHistory.TargetPaths))
$txtTarget.AutoCompleteMode = [System.Windows.Forms.AutoCompleteMode]::SuggestAppend
$txtTarget.AutoCompleteSource = [System.Windows.Forms.AutoCompleteSource]::ListItems
$txtTarget.Location = New-Object System.Drawing.Point(22, 98)
$txtTarget.Size = New-Object System.Drawing.Size(460, 25)
$txtTarget.Text = if ($TargetFile) { $TargetFile } else { "" }
$txtTarget.AllowDrop = $true
$form.Controls.Add($txtTarget)

$btnBrowseTarget = New-Object System.Windows.Forms.Button
$btnBrowseTarget.Text = "찾아보기..."
$btnBrowseTarget.Location = New-Object System.Drawing.Point(490, 96)
$btnBrowseTarget.Size = New-Object System.Drawing.Size(95, 29)
$btnBrowseTarget.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnBrowseTarget.BackColor = [System.Drawing.Color]::FromArgb(241, 245, 249)
$form.Controls.Add($btnBrowseTarget)

# 3. 옵션 체크박스
$chkSameFile = New-Object System.Windows.Forms.CheckBox
$chkSameFile.Text = "규칙 파일과 대상 파일이 동일함 (동일 파일 적용)"
$chkSameFile.Location = New-Object System.Drawing.Point(22, 134)
$chkSameFile.AutoSize = $true
$form.Controls.Add($chkSameFile)

$chkBackup = New-Object System.Windows.Forms.CheckBox
$chkBackup.Text = "백업(.bak) 자동 생성"
$chkBackup.Checked = $true
$chkBackup.Location = New-Object System.Drawing.Point(340, 134)
$chkBackup.AutoSize = $true
$form.Controls.Add($chkBackup)

# 4. 상태 메시지 및 실행/닫기 버튼
$lblStatus = New-Object System.Windows.Forms.Label
$lblStatus.Text = "경로를 입력하거나 파일을 창으로 드래그 앤 드롭하세요."
$lblStatus.Location = New-Object System.Drawing.Point(22, 168)
$lblStatus.Size = New-Object System.Drawing.Size(330, 42)
$lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(100, 116, 139)
$form.Controls.Add($lblStatus)

$btnExecute = New-Object System.Windows.Forms.Button
$btnExecute.Text = "치환 실행"
$btnExecute.Location = New-Object System.Drawing.Point(365, 168)
$btnExecute.Size = New-Object System.Drawing.Size(120, 38)
$btnExecute.BackColor = [System.Drawing.Color]::FromArgb(22, 163, 74)
$btnExecute.ForeColor = [System.Drawing.Color]::White
$btnExecute.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnExecute.Font = New-Object System.Drawing.Font("Malgun Gothic", 10, [System.Drawing.FontStyle]::Bold)
$btnExecute.Cursor = [System.Windows.Forms.Cursors]::Hand
$form.Controls.Add($btnExecute)

$btnClose = New-Object System.Windows.Forms.Button
$btnClose.Text = "닫기"
$btnClose.Location = New-Object System.Drawing.Point(495, 168)
$btnClose.Size = New-Object System.Drawing.Size(90, 38)
$btnClose.BackColor = [System.Drawing.Color]::FromArgb(241, 245, 249)
$btnClose.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnClose.Cursor = [System.Windows.Forms.Cursors]::Hand
$btnClose.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.Controls.Add($btnClose)

$form.AcceptButton = $btnExecute
$form.CancelButton = $btnClose

# 동일 파일 체크박스 이벤트
$chkSameFile.Add_CheckedChanged({
    if ($chkSameFile.Checked) {
        $script:SeparateTarget = $txtTarget.Text
        $txtTarget.Text = $txtRule.Text
        $txtTarget.Enabled = $false
        $btnBrowseTarget.Enabled = $false
    } else {
        $txtTarget.Enabled = $true
        $btnBrowseTarget.Enabled = $true
        $txtTarget.Text = $script:SeparateTarget
    }
})

$txtRule.Add_TextChanged({
    if ($chkSameFile.Checked) {
        $txtTarget.Text = $txtRule.Text
    }
})

# 파일 찾아보기 버튼 이벤트
$btnBrowseRule.Add_Click({
    $dlg = New-Object System.Windows.Forms.OpenFileDialog
    $dlg.Filter = "문서/텍스트 파일 (*.md;*.txt;*.json)|*.md;*.txt;*.json|모든 파일 (*.*)|*.*"
    $dlg.Title = "규칙 파일 선택"
    if ($txtRule.Text -and (Test-Path $txtRule.Text)) {
        $dlg.InitialDirectory = Split-Path -Parent $txtRule.Text
    } else {
        $dlg.InitialDirectory = $ScriptDir
    }
    if ($dlg.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::OK) {
        $txtRule.Text = $dlg.FileName
        if ($chkSameFile.Checked) { $txtTarget.Text = $dlg.FileName }
        $lblStatus.Text = "규칙 파일이 지정되었습니다."
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
    }
})

$btnBrowseTarget.Add_Click({
    $dlg = New-Object System.Windows.Forms.OpenFileDialog
    $dlg.Filter = "텍스트/문서 파일 (*.txt;*.md;*.json;*.html;*.xml)|*.txt;*.md;*.json;*.html;*.xml|모든 파일 (*.*)|*.*"
    $dlg.Title = "치환 대상 파일 선택"
    if ($txtTarget.Text -and (Test-Path $txtTarget.Text)) {
        $dlg.InitialDirectory = Split-Path -Parent $txtTarget.Text
    } elseif ($txtRule.Text -and (Test-Path $txtRule.Text)) {
        $dlg.InitialDirectory = Split-Path -Parent $txtRule.Text
    } else {
        $dlg.InitialDirectory = $ScriptDir
    }
    if ($dlg.ShowDialog($form) -eq [System.Windows.Forms.DialogResult]::OK) {
        $txtTarget.Text = $dlg.FileName
        $lblStatus.Text = "대상 파일이 지정되었습니다."
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
    }
})

# 드래그 앤 드롭 핸들러
$dragEnterHandler = {
    param($s, $e)
    if ($e.Data.GetDataPresent([System.Windows.Forms.DataFormats]::FileDrop)) {
        $e.Effect = [System.Windows.Forms.DragDropEffects]::Copy
    }
}

$txtRule.Add_DragEnter($dragEnterHandler)
$txtRule.Add_DragDrop({
    param($s, $e)
    $files = $e.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    if ($files.Length -gt 0) {
        $txtRule.Text = $files[0]
        if ($chkSameFile.Checked) { $txtTarget.Text = $files[0] }
        $lblStatus.Text = "규칙 파일이 지정되었습니다."
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
    }
})

$txtTarget.Add_DragEnter($dragEnterHandler)
$txtTarget.Add_DragDrop({
    param($s, $e)
    $files = $e.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    if ($files.Length -gt 0) {
        $txtTarget.Text = $files[0]
        $lblStatus.Text = "대상 파일이 지정되었습니다."
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
    }
})

$form.Add_DragEnter($dragEnterHandler)
$form.Add_DragDrop({
    param($s, $e)
    $files = $e.Data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    if ($files.Length -ge 2) {
        $chkSameFile.Checked = $false
        $txtRule.Text = $files[0]
        $txtTarget.Text = $files[1]
        $lblStatus.Text = "규칙 및 대상 파일이 지정되었습니다."
    } elseif ($files.Length -eq 1) {
        if (-not $txtRule.Text) {
            $txtRule.Text = $files[0]
            if ($chkSameFile.Checked) { $txtTarget.Text = $files[0] }
            $lblStatus.Text = "규칙 파일이 지정되었습니다."
        } else {
            $chkSameFile.Checked = $false
            $txtTarget.Text = $files[0]
            $lblStatus.Text = "대상 파일이 지정되었습니다."
        }
    }
    $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
})

# 치환 실행 버튼 이벤트
$btnExecute.Add_Click({
    $ruleFile = $txtRule.Text.Trim()
    $targetFile = $txtTarget.Text.Trim()

    if (-not $ruleFile) {
        [System.Windows.Forms.MessageBox]::Show("규칙 파일 경로를 지정해 주세요.", "안내", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }
    if (-not (Test-Path $ruleFile)) {
        [System.Windows.Forms.MessageBox]::Show("지정된 규칙 파일을 찾을 수 없습니다:`n$ruleFile", "파일 없음", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }
    if (-not $targetFile) {
        [System.Windows.Forms.MessageBox]::Show("적용할 대상 파일 경로를 지정해 주세요.", "안내", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        return
    }
    if (-not (Test-Path $targetFile)) {
        [System.Windows.Forms.MessageBox]::Show("지정된 대상 파일을 찾을 수 없습니다:`n$targetFile", "파일 없음", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
        return
    }

    Save-PathHistory
    try {
        $lblStatus.Text = "규칙 파싱 및 정렬 중..."
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(30, 41, 59)
        $form.Refresh()

        # 규칙 파일 내 [file_contents_replacer] 구간 파싱 및 정렬 갱신
        $sortedRules = Sort-And-UpdateSection -FilePath $ruleFile

        if ($sortedRules.Count -eq 0) {
            [System.Windows.Forms.MessageBox]::Show("[file_contents_replacer] 섹션에 유효한 치환 규칙이 없습니다.`n`n파일 최상단에 생성된 예시 규칙을 확인해 주세요.", "규칙 없음", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
            $lblStatus.Text = "상태: 유효한 규칙 없음"
            return
        }

        # 치환 실행
        $lblStatus.Text = "본문 치환 진행 중..."
        $form.Refresh()

        $result = Invoke-ContentReplacement -TargetFile $targetFile -Rules $sortedRules -CreateBackup $chkBackup.Checked

        $protectMsg = if ($result.SectionProtected) { "`n`n(규칙 섹션은 100% 원본 그대로 보호됨)" } else { "" }
        $backupMsg = if ($result.BackupPath) { "`n백업 생성: $($result.BackupPath)" } else { "" }

        $lblStatus.Text = "치환 완료! (총 $($result.TotalCount)회 치환됨)"
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(22, 163, 74)

        [System.Windows.Forms.MessageBox]::Show("치환이 완료되었습니다!`n`n총 치환 횟수: $($result.TotalCount)회`n적용 대상: $targetFile$protectMsg$backupMsg", "치환 완료", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
    } catch {
        $lblStatus.Text = "오류 발생: $($_.Exception.Message)"
        $lblStatus.ForeColor = [System.Drawing.Color]::FromArgb(220, 38, 38)
        [System.Windows.Forms.MessageBox]::Show("치환 실행 실패:`n$($_.Exception.Message)", "오류", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

$btnClose.Add_Click({
    $form.Close()
})

# 모든 체크 옵션은 실행할 때마다 기본 활성화합니다.
# 별도 대상 경로는 동일 파일 옵션을 해제하면 복원합니다.
$script:SeparateTarget = $txtTarget.Text
$chkSameFile.Checked = $true
$form.Add_FormClosing({ Save-PathHistory })

# 폼 표시 (불필요한 시작 팝업 일체 없음)
[void]$form.ShowDialog()
