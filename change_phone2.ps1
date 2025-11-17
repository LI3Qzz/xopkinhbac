# Script thay đổi số điện thoại trong tất cả file HTML
# Không làm thay đổi encoding

$oldPhone = "0337154318"
$newPhone = "0975569136"

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THAY DOI SO DIEN THOAI" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Thay doi: $oldPhone -> $newPhone"
Write-Host ""

$count = 0
$changed = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi encoding hien tai (UTF-8)
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        # Kiem tra xem co so dien thoai cu khong
        if ($content.Contains($oldPhone)) {
            # Thay the so dien thoai
            $content = $content.Replace($oldPhone, $newPhone)
            
            # Luu lai voi cung encoding (UTF-8 with BOM)
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
            $changed++
            Write-Host "  [+] Da thay doi: $($file.Name)" -ForegroundColor Green
        }
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "  Da xu ly $count file..." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "  [!] Loi: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da xu ly: $count file" -ForegroundColor Green
Write-Host "Da thay doi: $changed file" -ForegroundColor Green
Write-Host ""
Write-Host "So dien thoai moi: $newPhone" -ForegroundColor Cyan
Write-Host ""
