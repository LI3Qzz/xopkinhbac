# Script thay đổi số điện thoại riêng biệt
# Tư Vấn Miễn Phí: 0975569136
# Zalo: 0337154318

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THAY DOI SO DIEN THOAI" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host ""

$count = 0
$changed = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi encoding hien tai (UTF-8)
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay the "Zalo: 0975569136" thanh "Zalo: 0337154318"
        if ($content.Contains('Zalo: 0975569136')) {
            $content = $content.Replace('Zalo: 0975569136', 'Zalo: 0337154318')
            $modified = $true
        }
        
        # Thay the trong tag <p>
        if ($content.Contains('<p>Zalo: 0975569136</p>')) {
            $content = $content.Replace('<p>Zalo: 0975569136</p>', '<p>Zalo: 0337154318</p>')
            $modified = $true
        }
        
        if ($modified) {
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
Write-Host "Ket qua:" -ForegroundColor Cyan
Write-Host "  - Tu Van Mien Phi: 0975569136" -ForegroundColor Cyan
Write-Host "  - Zalo: 0337154318" -ForegroundColor Cyan
Write-Host ""
