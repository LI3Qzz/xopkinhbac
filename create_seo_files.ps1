# Script tạo các file SEO cần thiết

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  TAO FILE SEO CHO DU AN" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 1. Tạo sitemap.xml
Write-Host "[1/3] Tao sitemap.xml..." -ForegroundColor Yellow

$sitemapContent = @"
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://xopepsminhdang.com/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/ve-chung-toi/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/xop-eps-dinh-hinh/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/blox-dang-khoi/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/hang-dong-goi/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/ton-nen-chong-nong-trong-xay-dung/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.9</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/dich-vu/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/tin-tuc/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>daily</changefreq>
    <priority>0.7</priority>
  </url>
  <url>
    <loc>https://xopepsminhdang.com/lien-he/</loc>
    <lastmod>2025-01-27</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.6</priority>
  </url>
</urlset>
"@

[System.IO.File]::WriteAllText("xopkinh.bac/sitemap.xml", $sitemapContent, [System.Text.Encoding]::UTF8)
Write-Host "  [+] Da tao sitemap.xml" -ForegroundColor Green

# 2. Tạo robots.txt
Write-Host "[2/3] Tao robots.txt..." -ForegroundColor Yellow

$robotsContent = @"
User-agent: *
Allow: /

# Sitemap
Sitemap: https://xopepsminhdang.com/sitemap.xml

# Disallow admin pages
Disallow: /wp-admin/
Disallow: /wp-includes/
Disallow: /wp-content/plugins/
Disallow: /wp-content/themes/

# Allow CSS and JS
Allow: /wp-content/uploads/
Allow: *.css
Allow: *.js
"@

[System.IO.File]::WriteAllText("xopkinh.bac/robots.txt", $robotsContent, [System.Text.Encoding]::UTF8)
Write-Host "  [+] Da tao robots.txt" -ForegroundColor Green

# 3. Tạo file hướng dẫn SEO
Write-Host "[3/3] Tao huong dan SEO..." -ForegroundColor Yellow

$seoGuide = @"
# HƯỚNG DẪN TỐI ƯU SEO CHO DỰ ÁN

## 1. CÁC FILE ĐÃ TẠO

### sitemap.xml
- Đã tạo sitemap với các trang chính
- Submit lên Google Search Console: https://search.google.com/search-console
- Đường dẫn: https://xopepsminhdang.com/sitemap.xml

### robots.txt
- Hướng dẫn bot tìm kiếm crawl website
- Chặn các thư mục không cần thiết
- Đường dẫn: https://xopepsminhdang.com/robots.txt

## 2. GOOGLE SEARCH CONSOLE

### Cách submit sitemap:
1. Truy cập: https://search.google.com/search-console
2. Chọn property: xopepsminhdang.com
3. Vào menu "Sitemaps"
4. Nhập: sitemap.xml
5. Click "Submit"

### Kiểm tra index:
- Vào "URL Inspection"
- Nhập URL cần kiểm tra
- Click "Request Indexing"

## 3. CẢI THIỆN SEO

### Meta Tags (Đã có):
✅ Title tags
✅ Meta descriptions
✅ Open Graph tags
✅ Twitter cards
✅ Canonical URLs

### Cần thêm:
- [ ] Tối ưu hình ảnh (thêm alt text)
- [ ] Tăng tốc độ tải trang
- [ ] Thêm structured data (Schema.org)
- [ ] Tạo backlinks chất lượng
- [ ] Viết content dài hơn (>500 từ)

## 4. TỪ KHÓA CHÍNH

- Xốp EPS
- Xốp EPS Kinh Bắc
- Xốp định hình
- Blox dạng khối
- Tôn nền chống nóng
- Hàng đóng gói xốp EPS

## 5. GOOGLE ADS

✅ Đã cài đặt Google Ads tracking (AW-17732698416)
✅ Tracking cuộc gọi
✅ Tracking Zalo
✅ Tracking Email

## 6. KIỂM TRA SEO

### Tools miễn phí:
- Google PageSpeed Insights: https://pagespeed.web.dev/
- Google Mobile-Friendly Test: https://search.google.com/test/mobile-friendly
- Schema Markup Validator: https://validator.schema.org/

### Checklist:
- [ ] Sitemap đã submit
- [ ] Robots.txt hoạt động
- [ ] Tất cả trang có title unique
- [ ] Tất cả trang có meta description
- [ ] Hình ảnh có alt text
- [ ] Mobile-friendly
- [ ] Tốc độ tải < 3s
- [ ] HTTPS enabled
- [ ] Structured data

## 7. LIÊN HỆ

- Website: https://xopepsminhdang.com
- Phone: 0975569136
- Zalo: 0337154318
- Email: nhuaxopkinhbac@gmail.com
"@

[System.IO.File]::WriteAllText("HUONG_DAN_SEO.md", $seoGuide, [System.Text.Encoding]::UTF8)
Write-Host "  [+] Da tao HUONG_DAN_SEO.md" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da tao cac file SEO:" -ForegroundColor Cyan
Write-Host "  1. xopkinh.bac/sitemap.xml" -ForegroundColor Cyan
Write-Host "  2. xopkinh.bac/robots.txt" -ForegroundColor Cyan
Write-Host "  3. HUONG_DAN_SEO.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "BUOC TIEP THEO:" -ForegroundColor Yellow
Write-Host "  1. Upload sitemap.xml va robots.txt len server" -ForegroundColor Yellow
Write-Host "  2. Submit sitemap.xml len Google Search Console" -ForegroundColor Yellow
Write-Host "  3. Doc file HUONG_DAN_SEO.md de biet them chi tiet" -ForegroundColor Yellow
Write-Host ""
