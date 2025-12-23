# Script thay đổi số điện thoại trong floating button

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THAY DOI SO DIEN THOAI BUTTON" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Thay doi: 0975569136 -> 0337154318"
Write-Host ""

$count = 0
$changed = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay doi so dien thoai trong button (href="tel:0975569136")
        if ($content.Contains('href="tel:0975569136"')) {
            $content = $content.Replace('href="tel:0975569136"', 'href="tel:0337154318"')
            $modified = $true
        }
        
        if ($modified) {
            # Luu file
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
Write-Host "Button goi dien bay gio: 0337154318" -ForegroundColor Cyan
Write-Host ""
