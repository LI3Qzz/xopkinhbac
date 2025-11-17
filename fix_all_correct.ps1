# Script sửa lỗi encoding hoàn chỉnh
# Dựa trên các từ đúng từ website gốc

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SUA LOI ENCODING TIENG VIET" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host ""

# Định nghĩa các mapping (từ dài đến ngắn)
$mappings = @(
    # Các cụm từ hoàn chỉnh
    @{From='X?P EPS Ð?NH HÌNH'; To='Xốp EPS Định Hình'}
    @{From='X?P EPS �?NH H�NH'; To='Xốp EPS Định Hình'}
    @{From='x?p EPS ð?nh hình'; To='xốp EPS định hình'}
    @{From='X?P EPS Kinh B?c'; To='Xốp EPS Kinh Bắc'}
    @{From='x?p EPS kinh b?c'; To='xốp EPS kinh bắc'}
    @{From='Blox D?ng Kh?i'; To='Blox Dạng Khối'}
    @{From='blox d?ng kh?i'; To='blox dạng khối'}
    @{From='Hàng Ðóng Gói'; To='Hàng Đóng Gói'}
    @{From='hàng ðóng gói'; To='hàng đóng gói'}
    @{From='H�ng ��ng G�i'; To='Hàng Đóng Gói'}
    @{From='h�ng ��ng g�i'; To='hàng đóng gói'}
    @{From='Kinh B?c'; To='Kinh Bắc'}
    @{From='kinh b?c'; To='kinh bắc'}
    @{From='T�n n?n'; To='Tôn nền'}
    @{From='t�n n?n'; To='tôn nền'}
    @{From='x�y d?ng'; To='xây dựng'}
    @{From='X�y d?ng'; To='Xây dựng'}
    @{From='D?ch V?'; To='Dịch Vụ'}
    @{From='d?ch v?'; To='dịch vụ'}
    @{From='H�NH ?NH'; To='HÌNH ẢNH'}
    @{From='h�nh ?nh'; To='hình ảnh'}
    @{From='NHÀ XU?NG'; To='NHÀ XƯỞNG'}
    @{From='nhà xu?ng'; To='nhà xưởng'}
    @{From='Tin T?c'; To='Tin Tức'}
    @{From='tin t?c'; To='tin tức'}
    @{From='Li�n H?'; To='Liên Hệ'}
    @{From='li�n h?'; To='liên hệ'}
    @{From='TRANG CH?'; To='TRANG CHỦ'}
    @{From='Trang ch?'; To='Trang chủ'}
    @{From='trang ch?'; To='trang chủ'}
    @{From='V? CH�NG T�I'; To='VỀ CHÚNG TÔI'}
    @{From='v? chúng t�i'; To='về chúng tôi'}
    @{From='S?N PH?M'; To='SẢN PHẨM'}
    @{From='s?n ph?m'; To='sản phẩm'}
    
    # Các từ đơn
    @{From='X?P EPS'; To='Xốp EPS'}
    @{From='x?p EPS'; To='xốp EPS'}
    @{From='X?p'; To='Xốp'}
    @{From='x?p'; To='xốp'}
    @{From='Ð?NH'; To='Định'}
    @{From='ð?nh'; To='định'}
    @{From='�?NH'; To='Định'}
    @{From='D?ng'; To='Dạng'}
    @{From='d?ng'; To='dạng'}
    @{From='Kh?i'; To='Khối'}
    @{From='kh?i'; To='khối'}
    @{From='Ðóng'; To='Đóng'}
    @{From='ðóng'; To='đóng'}
    @{From='��ng'; To='Đóng'}
    @{From='G�i'; To='Gói'}
    @{From='g�i'; To='gói'}
    @{From='H�ng'; To='Hàng'}
    @{From='h�ng'; To='hàng'}
    @{From='B?c'; To='Bắc'}
    @{From='b?c'; To='bắc'}
    @{From='T�n'; To='Tôn'}
    @{From='t�n'; To='tôn'}
    @{From='n?n'; To='nền'}
    @{From='N?n'; To='Nền'}
    @{From='ch?ng'; To='chống'}
    @{From='Ch?ng'; To='Chống'}
    @{From='n�ng'; To='nóng'}
    @{From='N�ng'; To='Nóng'}
    @{From='d?ng'; To='dựng'}
    @{From='D?ng'; To='Dựng'}
    @{From='D?ch'; To='Dịch'}
    @{From='d?ch'; To='dịch'}
    @{From='V?'; To='Vụ'}
    @{From='v?'; To='vụ'}
    @{From='H�NH'; To='HÌNH'}
    @{From='h�nh'; To='hình'}
    @{From='?NH'; To='ẢNH'}
    @{From='?nh'; To='ảnh'}
    @{From='XU?NG'; To='XƯỞNG'}
    @{From='xu?ng'; To='xưởng'}
    @{From='T?c'; To='Tức'}
    @{From='t?c'; To='tức'}
    @{From='Li�n'; To='Liên'}
    @{From='li�n'; To='liên'}
    @{From='H?'; To='Hệ'}
    @{From='h?'; To='hệ'}
    @{From='CH?'; To='CHỦ'}
    @{From='ch?'; To='chủ'}
    @{From='V?'; To='VỀ'}
    @{From='v?'; To='về'}
    @{From='CH�NG'; To='CHÚNG'}
    @{From='chúng'; To='chúng'}
    @{From='T�I'; To='TÔI'}
    @{From='t�i'; To='tôi'}
    @{From='S?N'; To='SẢN'}
    @{From='s?n'; To='sản'}
    @{From='PH?M'; To='PHẨM'}
    @{From='ph?m'; To='phẩm'}
    
    # Ký tự đơn (cuối cùng)
    @{From='Ð'; To='Đ'}
    @{From='ð'; To='đ'}
    @{From='�'; To='Đ'}
)

Write-Host "Dang sua loi encoding..." -ForegroundColor Yellow
Write-Host ""

$count = 0
$totalFixed = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi UTF-8
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay the theo thu tu uu tien
        foreach ($mapping in $mappings) {
            if ($content.Contains($mapping.From)) {
                $content = $content.Replace($mapping.From, $mapping.To)
                $modified = $true
            }
        }
        
        if ($modified) {
            # Luu lai voi UTF-8 BOM
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
            $totalFixed++
        }
        
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
Write-Host "Da xu ly: $count file" -ForegroundColor Green
Write-Host "Da sua: $totalFixed file" -ForegroundColor Green
Write-Host ""
Write-Host "Vui long mo lai trinh duyet va nhan Ctrl+F5 de xem ket qua" -ForegroundColor Cyan
Write-Host ""
