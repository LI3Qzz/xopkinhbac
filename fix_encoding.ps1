# Script sửa lỗi encoding UTF-8 cho tất cả file HTML
# Đọc file với encoding hiện tại và lưu lại với UTF-8 BOM

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tìm thấy $($htmlFiles.Count) file HTML"
Write-Host "Đang sửa encoding..."

$count = 0
foreach ($file in $htmlFiles) {
    try {
        # Đọc nội dung file với encoding mặc định
        $content = Get-Content -Path $file.FullName -Raw -Encoding Default
        
        # Lưu lại với UTF-8 có BOM
        $utf8BOM = New-Object System.Text.UTF8Encoding $true
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8BOM)
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "Đã xử lý $count file..."
        }
    }
    catch {
        Write-Host "Lỗi khi xử lý file: $($file.FullName)" -ForegroundColor Red
    }
}

Write-Host "`nHoàn thành! Đã sửa $count file HTML" -ForegroundColor Green
