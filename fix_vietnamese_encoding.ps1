# Script sửa lỗi encoding tiếng Việt cho tất cả file HTML
# File gốc từ HTTrack có encoding UTF-8 nhưng nội dung bị lỗi

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Dang sua encoding tieng Viet..."

$count = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi UTF-8
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        # Kiem tra xem co ky tu loi khong
        if ($content -match '\?') {
            # Chuyen doi: doc lai voi Windows-1252 va luu voi UTF-8
            $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
            
            # Loai bo BOM neu co
            if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
                $bytes = $bytes[3..($bytes.Length-1)]
            }
            
            # Doc voi Windows-1252
            $win1252 = [System.Text.Encoding]::GetEncoding(1252)
            $text = $win1252.GetString($bytes)
            
            # Luu lai voi UTF-8 BOM
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $text, $utf8)
            
            $count++
            if ($count % 50 -eq 0) {
                Write-Host "Da xu ly $count file..."
            }
        }
    }
    catch {
        Write-Host "Loi khi xu ly file: $($file.Name)" -ForegroundColor Yellow
    }
}

Write-Host "`nHoan thanh! Da sua $count file HTML" -ForegroundColor Green
Write-Host "Vui long mo lai trinh duyet de xem ket qua"
