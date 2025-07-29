# Script PowerShell để sửa navigation và search form trong website XỐP KINH BẮC

Write-Host "🚀 Bắt đầu sửa navigation và search form..." -ForegroundColor Green

# Tìm tất cả file HTML
$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Recurse -Filter "*.html" | Where-Object {
    $_.FullName -notmatch "wp-content\\uploads" -and 
    $_.FullName -notmatch "wp-json" -and 
    $_.FullName -notmatch "feed"
}

Write-Host "🔍 Tìm thấy $($htmlFiles.Count) file HTML" -ForegroundColor Yellow

$searchFixed = 0
$navFixed = 0

foreach ($file in $htmlFiles) {
    Write-Host "📄 Đang xử lý: $($file.Name)" -ForegroundColor Cyan
    
    try {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        
        # Sửa search form
        $originalCount = ([regex]::Matches($content, 'action="https://xopkinhbac\.com/"')).Count
        if ($originalCount -gt 0) {
            $content = $content -replace 'action="https://xopkinhbac\.com/"', 'action="../index.html"'
            Set-Content $file.FullName $content -Encoding UTF8
            Write-Host "✅ Đã sửa $originalCount search form trong $($file.Name)" -ForegroundColor Green
            $searchFixed++
        }
        
        # Thêm link HÌNH ẢNH NHÀ XƯỞNG vào navigation
        $hinhAnhLink = '<li id="menu-item-999" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-999 menu-item-design-default"><a href="../hinh-anh-xuong/index.html" class="nav-top-link">HÌNH ẢNH NHÀ XƯỞNG</a></li>'
        $hinhAnhMobileLink = '<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-999"><a href="../hinh-anh-xuong/index.html">HÌNH ẢNH NHÀ XƯỞNG</a></li>'
        
        $changesMade = $false
        
        # Pattern để tìm navigation menu
        $patterns = @(
            '<li id="menu-item-241"[^>]*><a[^>]*>Dịch Vụ</a></li>\s*<li id="menu-item-242"[^>]*><a[^>]*>Tin Tức</a></li>\s*<li id="menu-item-250"[^>]*><a[^>]*>Liên Hệ</a></li>',
            '<li id="menu-item-241"[^>]*><a[^>]*>Dịch Vụ</a></li>\s*<li id="menu-item-250"[^>]*><a[^>]*>Liên Hệ</a></li>',
            '<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>\s*<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-242"><a[^>]*>Tin Tức</a></li>\s*<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-250"><a[^>]*>Liên Hệ</a></li>',
            '<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>\s*<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-250"><a[^>]*>Liên Hệ</a></li>'
        )
        
        foreach ($pattern in $patterns) {
            if ($content -match $pattern) {
                # Thêm link vào sau "Dịch Vụ"
                $content = $content -replace '(<li[^>]*>Dịch Vụ</a></li>)', "`$1`n$hinhAnhLink"
                
                # Thêm link vào mobile menu
                $content = $content -replace '(<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>)', "`$1`n$hinhAnhMobileLink"
                
                $changesMade = $true
                break
            }
        }
        
        if ($changesMade) {
            Set-Content $file.FullName $content -Encoding UTF8
            Write-Host "✅ Đã thêm link HÌNH ẢNH NHÀ XƯỞNG vào $($file.Name)" -ForegroundColor Green
            $navFixed++
        }
        
    } catch {
        Write-Host "❌ Lỗi khi xử lý $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n📊 Tổng kết:" -ForegroundColor Yellow
Write-Host "   - Đã sửa search form trong $searchFixed file" -ForegroundColor Green
Write-Host "   - Đã thêm link navigation trong $navFixed file" -ForegroundColor Green
Write-Host "   - Tổng cộng xử lý $($htmlFiles.Count) file" -ForegroundColor Green

Write-Host "✅ Hoàn thành!" -ForegroundColor Green 