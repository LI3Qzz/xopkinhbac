# Script sửa lỗi encoding UTF-8 cho tất cả file HTML
# Chuyển đổi từ Windows-1252 sang UTF-8

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Dang sua encoding..."

$count = 0
$encoding1252 = [System.Text.Encoding]::GetEncoding(1252)
$encodingUTF8 = [System.Text.UTF8Encoding]::new($true)

foreach ($file in $htmlFiles) {
    try {
        # Doc noi dung file voi encoding Windows-1252
        $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
        $content = $encoding1252.GetString($bytes)
        
        # Luu lai voi UTF-8 BOM
        [System.IO.File]::WriteAllText($file.FullName, $content, $encodingUTF8)
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "Da xu ly $count file..."
        }
    }
    catch {
        Write-Host "Loi khi xu ly file: $($file.FullName)" -ForegroundColor Red
    }
}

Write-Host "`nHoan thanh! Da sua $count file HTML" -ForegroundColor Green
