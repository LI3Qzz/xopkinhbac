# Script thay đổi số điện thoại từ 0931 801 102 sang 0337 154 318
$oldPhone = "0931 801 102"
$newPhone = "0337 154 318"

# Tìm tất cả các file HTML
$htmlFiles = Get-ChildItem -Path . -Filter *.html -Recurse -File

$count = 0
$changedFiles = @()

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    
    if ($content -match [regex]::Escape($oldPhone)) {
        $newContent = $content -replace [regex]::Escape($oldPhone), $newPhone
        Set-Content -Path $file.FullName -Value $newContent -Encoding UTF8 -NoNewline
        $count++
        $changedFiles += $file.FullName
        Write-Host "Đã thay đổi: $($file.FullName)" -ForegroundColor Green
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Tổng số file đã thay đổi: $count" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

if ($changedFiles.Count -gt 0) {
    Write-Host "`nDanh sách các file đã thay đổi:" -ForegroundColor Cyan
    $changedFiles | ForEach-Object { Write-Host "  - $_" }
}
