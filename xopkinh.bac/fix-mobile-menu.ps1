# Fix Mobile Menu - PowerShell Script
# Áp dụng mobile menu fix cho tất cả các trang HTML

Write-Host "🔧 Fix Mobile Menu - Bắt đầu..." -ForegroundColor Green

# Danh sách các trang cần fix
$pagesToFix = @(
    "tin-tuc/index.html",
    "lien-he/index.html",
    "blox-dang-khoi/index.html",
    "xop-eps-dinh-hinh/index.html",
    "ton-nen-chong-nong-trong-xay-dung/index.html",
    "hang-dong-goi/index.html",
    "xop-eps-kinh-bac/index.html",
    "xop-eps-dang-khoi/index.html",
    "xop-eps-dong-goi-hang-hoa/index.html",
    "xop-eps-dong-goi-thiet-bi/index.html",
    "xop-eps-don-nen/index.html",
    "xop-eps-dinh-hinh-hop-dong-hang/index.html",
    "xop-eps-dinh-hinh-dong-hang-trang-tri/index.html",
    "xop-eps-dinh-hinh-dong-goi-tuong/index.html",
    "xop-eps-dinh-hinh-1/index.html",
    "xop-eps-dinh-hinh-2/index.html",
    "xop-eps-dinh-hinh-3/index.html",
    "xop-eps-dinh-hinh-4/index.html",
    "xop-eps-dinh-hinh-5/index.html",
    "xop-eps-dinh-hinh-6/index.html",
    "xop-eps-dinh-hinh-7/index.html",
    "xop-eps-dinh-hinh-8/index.html",
    "xop-eps-dinh-hinh-9/index.html",
    "xop-eps-dinh-hinh-10/index.html",
    "xop-eps-dinh-hinh-11/index.html",
    "xop-eps-dinh-hinh-12/index.html",
    "xop-eps-dinh-hinh-13/index.html",
    "xop-eps-dinh-hinh-14/index.html",
    "xop-eps-dinh-hinh-15/index.html",
    "xop-eps-dinh-hinh-16/index.html",
    "xop-eps-dinh-hinh-17/index.html",
    "xop-eps-dinh-hinh-18/index.html",
    "xop-eps-dinh-hinh-19/index.html",
    "xop-eps-dinh-hinh-20/index.html",
    "xop-eps-dinh-hinh-21/index.html",
    "xop-eps-dinh-hinh-2-2/index.html",
    "xop-eps-dang-khoi-m2/index.html",
    "xop-eps-dang-khoi-m3/index.html",
    "xop-eps-dang-khoi-m4/index.html",
    "xop-eps-dang-khoi-m5/index.html",
    "xop-eps-dang-khoi-m6/index.html",
    "xop-eps-dang-khoi-m7/index.html",
    "xop-eps-kinh-bac-giai-phap-toi-uu-cho-moi-cong-trinh/index.html",
    "xop-eps-kinh-bac-giai-phap-dong-goi-hoan-hao-nang-tam-gia-tri-doanh-nghiep-cua-ban/index.html",
    "xop-eps-kinh-bac-chong-soc-cach-nhiet-tiet-kiem-chi-phi/index.html",
    "xop-eps-kinh-bac-chong-nang-cach-nhiet-giai-phap-hieu-qua-bao-ve-cong-trinh-khoi-tac-dong-mat-troi/index.html",
    "xop-eps-ton-nen/index.html",
    "xop-eps-ton-nen-kinh-bac-giai-phap-toi-uu-cho-moi-cong-trinh-xay-dung/index.html",
    "goc-xop-eps-dinh-hinh-dong-hang/index.html",
    "goc-xop-eps-dinh-hinh-loai-dai/index.html",
    "goc-xop-eps-chen-hang/index.html",
    "goc-xop-eps-dinh-hinh-hop-dong-hang/index.html",
    "goc-xop-eps-dinh-hinh-dong-goi-tuong/index.html",
    "goc-xop-eps-dinh-hinh-1/index.html",
    "goc-xop-eps-dinh-hinh-2/index.html",
    "goc-xop-eps-dinh-hinh-3/index.html",
    "goc-xop-eps-dinh-hinh-4/index.html",
    "goc-xop-eps-dinh-hinh-5/index.html",
    "goc-xop-eps-dinh-hinh-6/index.html",
    "goc-xop-eps-dinh-hinh-7/index.html",
    "goc-xop-eps-dinh-hinh-8/index.html",
    "goc-xop-eps-dinh-hinh-9/index.html",
    "goc-xop-eps-dinh-hinh-10/index.html",
    "goc-xop-eps-dinh-hinh-11/index.html",
    "goc-xop-eps-dinh-hinh-12/index.html",
    "goc-xop-eps-dinh-hinh-13/index.html",
    "goc-xop-eps-dinh-hinh-14/index.html",
    "goc-xop-eps-dinh-hinh-15/index.html",
    "goc-xop-eps-dinh-hinh-16/index.html",
    "goc-xop-eps-dinh-hinh-17/index.html",
    "goc-xop-eps-dinh-hinh-18/index.html",
    "goc-xop-eps-dinh-hinh-19/index.html",
    "goc-xop-eps-dinh-hinh-20/index.html",
    "goc-xop-eps-dinh-hinh-21/index.html",
    "goc-xop-eps-dinh-hinh-2-2/index.html",
    "goc-xop-eps-chen-hang/index.html",
    "goc-xop-eps-dong-hang/index.html",
    "goc-xop-eps-dinh-hinh-dong-goi/index.html",
    "goc-xop-eps-dinh-hinh-dong-hang/index.html",
    "goc-xop-eps-dinh-hinh-loai-dai/index.html",
    "goc-xop-eps-dinh-hinh-hop-dong-hang/index.html",
    "goc-xop-eps-dinh-hinh-dong-goi-tuong/index.html",
    "goc-xop-eps-dinh-hinh-1/index.html",
    "goc-xop-eps-dinh-hinh-2/index.html",
    "goc-xop-eps-dinh-hinh-3/index.html",
    "goc-xop-eps-dinh-hinh-4/index.html",
    "goc-xop-eps-dinh-hinh-5/index.html",
    "goc-xop-eps-dinh-hinh-6/index.html",
    "goc-xop-eps-dinh-hinh-7/index.html",
    "goc-xop-eps-dinh-hinh-8/index.html",
    "goc-xop-eps-dinh-hinh-9/index.html",
    "goc-xop-eps-dinh-hinh-10/index.html",
    "goc-xop-eps-dinh-hinh-11/index.html",
    "goc-xop-eps-dinh-hinh-12/index.html",
    "goc-xop-eps-dinh-hinh-13/index.html",
    "goc-xop-eps-dinh-hinh-14/index.html",
    "goc-xop-eps-dinh-hinh-15/index.html",
    "goc-xop-eps-dinh-hinh-16/index.html",
    "goc-xop-eps-dinh-hinh-17/index.html",
    "goc-xop-eps-dinh-hinh-18/index.html",
    "goc-xop-eps-dinh-hinh-19/index.html",
    "goc-xop-eps-dinh-hinh-20/index.html",
    "goc-xop-eps-dinh-hinh-21/index.html",
    "goc-xop-eps-dinh-hinh-2-2/index.html",
    "the-san-pham/xop-eps/index.html",
    "the-san-pham/xop-eps-dong-hang/index.html",
    "the-san-pham/xop-eps-dinh-hinh-dong-hang/index.html",
    "the-san-pham/xop-eps-dinh-hinh-dong-goi/index.html",
    "the-san-pham/xop-eps-dong-goi/index.html",
    "the-san-pham/xop-dang-khoi/index.html",
    "the-san-pham/goc-xop-chen-hang/index.html",
    "the-san-pham/xop-eps-xay-dung/index.html",
    "tai-khoan/index.html",
    "tai-khoan/lost-password/index.html",
    "author/aioaccount/index.html",
    "author/vinhlt/index.html",
    "kinh-bac-chuyen-san-xuat-gia-cong-xop-eps-dinh-hinh-dong-goi-hang-hoa-cach-nhiet-chong-am-chong-soc/index.html",
    "huong-dan-chong-nong-hieu-qua-cho-can-nha-moi-xay-bang-chat-lieu-xop-eps/index.html",
    "tai-sao-nen-dung-xop-cach-nhiet-eps-kinh-bac-cho-cong-trinh-chong-nong/index.html",
    "thi-cong-xop-eps-cach-nhiet-chong-nong-nhu-nao-de-dat-hieu-qua-toi-uu/index.html",
    "but-pha-doanh-thu-chinh-phuc-khach-hang-nho-dong-goi-van-chuyen-bang-xop-eps/index.html",
    "bi-quyet-van-chuyen-hang-hoa-di-muon-noi-ma-khong-so-be-vo-mop-meo/index.html"
)

# Hàm fix một trang
function Fix-Page {
    param([string]$pagePath)
    
    Write-Host "🔧 Fixing: $pagePath" -ForegroundColor Yellow
    
    try {
        if (!(Test-Path $pagePath)) {
            Write-Host "❌ File không tồn tại: $pagePath" -ForegroundColor Red
            return $false
        }
        
        $content = Get-Content $pagePath -Raw -Encoding UTF8
        $modified = $false
        
        # 1. Thêm mobile-fix.css nếu chưa có
        if ($content -notmatch "mobile-fix\.css") {
            $cssLink = '<link rel=''stylesheet'' id=''mobile-fix-css'' href=''../mobile-fix.css'' type=''text/css'' media=''all'' />'
            $content = $content -replace '</head>', "$cssLink`n`t</head>"
            $modified = $true
            Write-Host "✅ Added mobile-fix.css" -ForegroundColor Green
        }
        
        # 2. Thêm mobile-menu-fix.js nếu chưa có
        if ($content -notmatch "mobile-menu-fix\.js") {
            $jsScript = '<script type="text/javascript" src="../mobile-menu-fix.js"></script>'
            $content = $content -replace '</body>', "`n`t$jsScript`n</body>"
            $modified = $true
            Write-Host "✅ Added mobile-menu-fix.js" -ForegroundColor Green
        }
        
        # Ghi file nếu có thay đổi
        if ($modified) {
            Set-Content $pagePath $content -Encoding UTF8
            Write-Host "✅ Successfully fixed $pagePath" -ForegroundColor Green
            return $true
        } else {
            Write-Host "ℹ️ No changes needed" -ForegroundColor Blue
            return $false
        }
        
    } catch {
        Write-Host "❌ Error: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

# Fix từng trang
$totalPages = $pagesToFix.Count
$fixedPages = 0
$errorPages = 0

for ($i = 0; $i -lt $totalPages; $i++) {
    $pagePath = $pagesToFix[$i]
    Write-Host "`n[$($i + 1)/$totalPages] Processing: $pagePath" -ForegroundColor Cyan
    
    if (Fix-Page $pagePath) {
        $fixedPages++
    } else {
        $errorPages++
    }
}

Write-Host "`n📊 Summary:" -ForegroundColor Magenta
Write-Host "✅ Fixed pages: $fixedPages" -ForegroundColor Green
Write-Host "❌ Error pages: $errorPages" -ForegroundColor Red
Write-Host "📄 Total pages: $totalPages" -ForegroundColor Blue
Write-Host "🎉 Auto fix completed!" -ForegroundColor Green 