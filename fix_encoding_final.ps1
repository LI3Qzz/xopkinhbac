# Script sửa lỗi encoding UTF-8 cho tất cả file HTML
# Đọc file dưới dạng bytes và chuyển đổi chính xác

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Dang sua encoding..."

$count = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file duoi dang bytes
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        
        # Chuyen doi tu Latin1 (ISO-8859-1) sang UTF-8
        $latin1 = [System.Text.Encoding]::GetEncoding("ISO-8859-1")
        $utf8 = [System.Text.Encoding]::UTF8
        
        # Decode bytes thanh string voi Latin1
        $text = $latin1.GetString($bytes)
        
        # Encode lai thanh UTF-8
        $utf8Bytes = $utf8.GetBytes($text)
        
        # Ghi file voi UTF-8 BOM
        $bom = [byte[]](0xEF, 0xBB, 0xBF)
        $finalBytes = $bom + $utf8Bytes
        [System.IO.File]::WriteAllBytes($file.FullName, $finalBytes)
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "Da xu ly $count file..."
        }
    }
    catch {
        Write-Host "Loi khi xu ly file: $($file.FullName)" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}

Write-Host "`nHoan thanh! Da sua $count file HTML" -ForegroundColor Green
Write-Host "Vui long mo lai trinh duyet de xem ket qua"
