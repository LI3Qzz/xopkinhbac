# Script chuyển đổi encoding chính xác từ Windows-1252 sang UTF-8
# KHÔNG thay đổi nội dung, chỉ chuyển đổi encoding

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CHUYEN DOI ENCODING CHINH XAC" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Dang chuyen doi encoding..."
Write-Host ""

$count = 0
$encoding1252 = [System.Text.Encoding]::GetEncoding(1252)
$encodingUTF8 = [System.Text.UTF8Encoding]::new($true)

foreach ($file in $htmlFiles) {
    try {
        # Doc bytes goc
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        
        # Loai bo UTF-8 BOM neu co
        if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
            $bytes = $bytes[3..($bytes.Length-1)]
        }
        
        # Decode voi Windows-1252
        $text = $encoding1252.GetString($bytes)
        
        # Encode lai voi UTF-8 BOM
        [System.IO.File]::WriteAllText($file.FullName, $text, $encodingUTF8)
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "  [+] Da xu ly $count file..." -ForegroundColor Green
        }
    }
    catch {
        Write-Host "  [!] Loi: $($file.Name)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da chuyen doi $count file HTML tu Windows-1252 sang UTF-8" -ForegroundColor Green
Write-Host "Vui long mo lai trinh duyet va nhan Ctrl+F5 de xem ket qua" -ForegroundColor Green
Write-Host ""
