# Script sửa các ký tự tiếng Việt còn lại bị lỗi

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host "Dang sua cac ky tu con lai..."

# Bang mapping cac ky tu bi loi
$replacements = @{
    'X?p' = 'Xốp'
    'x?p' = 'xốp'
    'TRANG CH?' = 'TRANG CHỦ'
    'Trang ch?' = 'Trang chủ'
    'trang ch?' = 'trang chủ'
    'GI?I' = 'GIẢI'
    'Gi?i' = 'Giải'
    'gi?i' = 'giải'
    'T?I' = 'TỐI'
    'T?i' = 'Tối'
    't?i' = 'tối'
    'M?I' = 'MỌI'
    'M?i' = 'Mọi'
    'm?i' = 'mọi'
    'linh v?c' = 'lĩnh vực'
    'Linh v?c' = 'Lĩnh vực'
    's?n xu?t' = 'sản xuất'
    'S?n xu?t' = 'Sản xuất'
    'hi?u' = 'hiểu'
    'Hi?u' = 'Hiểu'
    'ch?t' = 'chất'
    'Ch?t' = 'Chất'
    'lu?ng' = 'lượng'
    'Lu?ng' = 'Lượng'
    'hi?u qu?' = 'hiệu quả'
    'Hi?u qu?' = 'Hiệu quả'
    'y?u t?' = 'yếu tố'
    'Y?u t?' = 'Yếu tố'
    'd?nh hình' = 'định hình'
    'D?nh hình' = 'Định hình'
    'tu?ng' = 'tượng'
    'Tu?ng' = 'Tượng'
    'Thi?t' = 'Thiết'
    'thi?t' = 'thiết'
    'B?' = 'Bị'
    'b?' = 'bị'
    'c?' = 'cụ'
    'C?' = 'Cụ'
    'tìm ki?m' = 'tìm kiếm'
    'Tìm ki?m' = 'Tìm kiếm'
    'b?i' = 'bởi'
    'B?i' = 'Bởi'
    'Ðu?c' = 'Được'
    'ðu?c' = 'được'
    'vi?t' = 'viết'
    'Vi?t' = 'Viết'
    'Th?i' = 'Thời'
    'th?i' = 'thời'
    'd?' = 'để'
    'D?' = 'Để'
    'd?c' = 'đọc'
    'D?c' = 'Đọc'
    'phút' = 'phút'
}

$count = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi UTF-8
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay the cac ky tu loi
        foreach ($key in $replacements.Keys) {
            if ($content -match [regex]::Escape($key)) {
                $content = $content -replace [regex]::Escape($key), $replacements[$key]
                $modified = $true
            }
        }
        
        if ($modified) {
            # Luu lai voi UTF-8 BOM
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
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
