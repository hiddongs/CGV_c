# PowerShell 스크립트: admin 관련 Action 파일들의 JSP 경로 수정
$files = Get-ChildItem -Path "c:\Users\user\git\CGV_c\src\main\java\kr\member\action\admin\*.java"

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # member/admin*.jsp 패턴을 member/admin/admin*.jsp로 변경
    $newContent = $content -replace 'return "member/admin([^/].*\.jsp)"', 'return "member/admin/admin$1"'
    
    # 변경된 내용이 있으면 파일 저장
    if ($content -ne $newContent) {
        Set-Content -Path $file.FullName -Value $newContent
        Write-Host "Updated: $($file.Name)"
    }
}

Write-Host "All admin action files have been updated."
