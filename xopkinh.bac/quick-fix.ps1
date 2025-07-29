# Quick Fix Mobile Menu - Script đơn giản
Write-Host "🔧 Quick Fix Mobile Menu - Bắt đầu..." -ForegroundColor Green

# Danh sách các trang quan trọng cần fix
$pagesToFix = @(
    "tin-tuc/index.html",
    "lien-he/index.html",
    "blox-dang-khoi/index.html",
    "xop-eps-dinh-hinh/index.html",
    "ton-nen-chong-nong-trong-xay-dung/index.html",
    "hang-dong-goi/index.html"
)

foreach ($pagePath in $pagesToFix) {
    Write-Host "🔧 Processing: $pagePath" -ForegroundColor Yellow
    
    if (Test-Path $pagePath) {
        $content = Get-Content $pagePath -Raw -Encoding UTF8
        $modified = $false
        
        # Thêm mobile-fix.css nếu chưa có
        if ($content -notmatch "mobile-fix\.css") {
            $cssLink = '<link rel=''stylesheet'' id=''mobile-fix-css'' href=''../mobile-fix.css'' type=''text/css'' media=''all'' />'
            $content = $content -replace '</head>', "$cssLink`n`t</head>"
            $modified = $true
            Write-Host "✅ Added mobile-fix.css" -ForegroundColor Green
        }
        
        # Thêm mobile-menu-fix.js nếu chưa có
        if ($content -notmatch "mobile-menu-fix\.js") {
            $jsScript = '<script type="text/javascript" src="../mobile-menu-fix.js"></script>'
            $content = $content -replace '</body>', "`n`t$jsScript`n</body>"
            $modified = $true
            Write-Host "✅ Added mobile-menu-fix.js" -ForegroundColor Green
        }
        
        if ($modified) {
            Set-Content $pagePath $content -Encoding UTF8
            Write-Host "✅ Fixed: $pagePath" -ForegroundColor Green
        } else {
            Write-Host "ℹ️ No changes needed: $pagePath" -ForegroundColor Blue
        }
    } else {
        Write-Host "❌ File not found: $pagePath" -ForegroundColor Red
    }
}

Write-Host "🎉 Quick fix completed!" -ForegroundColor Green 