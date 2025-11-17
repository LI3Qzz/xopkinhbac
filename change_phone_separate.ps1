# Script thay đổi số điện thoại riêng biệt cho Tư Vấn và Zalo
# Tư Vấn Miễn Phí: 0975569136
# Zalo: 0337154318

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THAY DOI SO DIEN THOAI" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Tu Van Mien Phi: 0975569136"
Write-Host "Zalo: 0337154318"
Write-Host ""

$count = 0
$changed = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi encoding hien tai (UTF-8)
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay the "Zalo: 0975569136" thanh "Zalo: 0337154318"
        if ($content -match 'Zalo:\s*0975569136') {
            $content = $content -replace 'Zalo:\s*0975569136', 'Zalo: 0337154318'
            $modified = $true
        }
        
        # Thay the trong JSON/JavaScript (value":"0975569136" cho Zalo)
        # Tim pattern: "channel":"Phone","value":"0975569136" va thay thanh Zalo number
        # Nhung giu nguyen Tu Van number
        
        # Xu ly truong hop trong script JSON
        if ($content -match '"hover_text":"Phone"[^}]*"value":"0975569136"') {
            # Day la so dien thoai chinh (Phone) - giu nguyen 0975569136
        }
        
        # Thay the Zalo number trong phan text
        $content = $content -replace '(<p>Zalo:\s*)0975569136(</p>)', '$10337154318$2'
        
        if ($modified -or ($content -ne [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8))) {
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
