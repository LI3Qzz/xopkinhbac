// Auto Fix Mobile Menu - Script tự động áp dụng fix cho tất cả các trang
(function() {
    'use strict';
    
    console.log('🔧 Auto Fix Mobile Menu - Bắt đầu...');
    
    // Danh sách các trang cần fix
    var pagesToFix = [
        'tin-tuc/index.html',
        'lien-he/index.html',
        'blox-dang-khoi/index.html',
        'xop-eps-dinh-hinh/index.html',
        'ton-nen-chong-nong-trong-xay-dung/index.html',
        'hang-dong-goi/index.html',
        'xop-eps-kinh-bac/index.html',
        'xop-eps-dang-khoi/index.html',
        'xop-eps-dong-goi-hang-hoa/index.html',
        'xop-eps-dong-goi-thiet-bi/index.html',
        'xop-eps-don-nen/index.html',
        'xop-eps-dinh-hinh-hop-dong-hang/index.html',
        'xop-eps-dinh-hinh-dong-hang-trang-tri/index.html',
        'xop-eps-dinh-hinh-dong-goi-tuong/index.html',
        'xop-eps-dinh-hinh-1/index.html',
        'xop-eps-dinh-hinh-2/index.html',
        'xop-eps-dinh-hinh-3/index.html',
        'xop-eps-dinh-hinh-4/index.html',
        'xop-eps-dinh-hinh-5/index.html',
        'xop-eps-dinh-hinh-6/index.html',
        'xop-eps-dinh-hinh-7/index.html',
        'xop-eps-dinh-hinh-8/index.html',
        'xop-eps-dinh-hinh-9/index.html',
        'xop-eps-dinh-hinh-10/index.html',
        'xop-eps-dinh-hinh-11/index.html',
        'xop-eps-dinh-hinh-12/index.html',
        'xop-eps-dinh-hinh-13/index.html',
        'xop-eps-dinh-hinh-14/index.html',
        'xop-eps-dinh-hinh-15/index.html',
        'xop-eps-dinh-hinh-16/index.html',
        'xop-eps-dinh-hinh-17/index.html',
        'xop-eps-dinh-hinh-18/index.html',
        'xop-eps-dinh-hinh-19/index.html',
        'xop-eps-dinh-hinh-20/index.html',
        'xop-eps-dinh-hinh-21/index.html',
        'xop-eps-dinh-hinh-2-2/index.html',
        'xop-eps-dang-khoi-m2/index.html',
        'xop-eps-dang-khoi-m3/index.html',
        'xop-eps-dang-khoi-m4/index.html',
        'xop-eps-dang-khoi-m5/index.html',
        'xop-eps-dang-khoi-m6/index.html',
        'xop-eps-dang-khoi-m7/index.html',
        'xop-eps-kinh-bac-giai-phap-toi-uu-cho-moi-cong-trinh/index.html',
        'xop-eps-kinh-bac-giai-phap-dong-goi-hoan-hao-nang-tam-gia-tri-doanh-nghiep-cua-ban/index.html',
        'xop-eps-kinh-bac-chong-soc-cach-nhiet-tiet-kiem-chi-phi/index.html',
        'xop-eps-kinh-bac-chong-nang-cach-nhiet-giai-phap-hieu-qua-bao-ve-cong-trinh-khoi-tac-dong-mat-troi/index.html',
        'xop-eps-ton-nen/index.html',
        'xop-eps-ton-nen-minh-dang-giai-phap-toi-uu-cho-moi-cong-trinh-xay-dung/index.html',
        'goc-xop-eps-dinh-hinh-dong-hang/index.html',
        'goc-xop-eps-dinh-hinh-loai-dai/index.html',
        'goc-xop-eps-chen-hang/index.html',
        'goc-xop-eps-dinh-hinh-hop-dong-hang/index.html',
        'goc-xop-eps-dinh-hinh-dong-goi-tuong/index.html',
        'goc-xop-eps-dinh-hinh-1/index.html',
        'goc-xop-eps-dinh-hinh-2/index.html',
        'goc-xop-eps-dinh-hinh-3/index.html',
        'goc-xop-eps-dinh-hinh-4/index.html',
        'goc-xop-eps-dinh-hinh-5/index.html',
        'goc-xop-eps-dinh-hinh-6/index.html',
        'goc-xop-eps-dinh-hinh-7/index.html',
        'goc-xop-eps-dinh-hinh-8/index.html',
        'goc-xop-eps-dinh-hinh-9/index.html',
        'goc-xop-eps-dinh-hinh-10/index.html',
        'goc-xop-eps-dinh-hinh-11/index.html',
        'goc-xop-eps-dinh-hinh-12/index.html',
        'goc-xop-eps-dinh-hinh-13/index.html',
        'goc-xop-eps-dinh-hinh-14/index.html',
        'goc-xop-eps-dinh-hinh-15/index.html',
        'goc-xop-eps-dinh-hinh-16/index.html',
        'goc-xop-eps-dinh-hinh-17/index.html',
        'goc-xop-eps-dinh-hinh-18/index.html',
        'goc-xop-eps-dinh-hinh-19/index.html',
        'goc-xop-eps-dinh-hinh-20/index.html',
        'goc-xop-eps-dinh-hinh-21/index.html',
        'goc-xop-eps-dinh-hinh-2-2/index.html',
        'goc-xop-eps-chen-hang/index.html',
        'goc-xop-eps-dong-hang/index.html',
        'goc-xop-eps-dinh-hinh-dong-goi/index.html',
        'goc-xop-eps-dinh-hinh-dong-hang/index.html',
        'goc-xop-eps-dinh-hinh-loai-dai/index.html',
        'goc-xop-eps-dinh-hinh-hop-dong-hang/index.html',
        'goc-xop-eps-dinh-hinh-dong-goi-tuong/index.html',
        'goc-xop-eps-dinh-hinh-1/index.html',
        'goc-xop-eps-dinh-hinh-2/index.html',
        'goc-xop-eps-dinh-hinh-3/index.html',
        'goc-xop-eps-dinh-hinh-4/index.html',
        'goc-xop-eps-dinh-hinh-5/index.html',
        'goc-xop-eps-dinh-hinh-6/index.html',
        'goc-xop-eps-dinh-hinh-7/index.html',
        'goc-xop-eps-dinh-hinh-8/index.html',
        'goc-xop-eps-dinh-hinh-9/index.html',
        'goc-xop-eps-dinh-hinh-10/index.html',
        'goc-xop-eps-dinh-hinh-11/index.html',
        'goc-xop-eps-dinh-hinh-12/index.html',
        'goc-xop-eps-dinh-hinh-13/index.html',
        'goc-xop-eps-dinh-hinh-14/index.html',
        'goc-xop-eps-dinh-hinh-15/index.html',
        'goc-xop-eps-dinh-hinh-16/index.html',
        'goc-xop-eps-dinh-hinh-17/index.html',
        'goc-xop-eps-dinh-hinh-18/index.html',
        'goc-xop-eps-dinh-hinh-19/index.html',
        'goc-xop-eps-dinh-hinh-20/index.html',
        'goc-xop-eps-dinh-hinh-21/index.html',
        'goc-xop-eps-dinh-hinh-2-2/index.html',
        'the-san-pham/xop-eps/index.html',
        'the-san-pham/xop-eps-dong-hang/index.html',
        'the-san-pham/xop-eps-dinh-hinh-dong-hang/index.html',
        'the-san-pham/xop-eps-dinh-hinh-dong-goi/index.html',
        'the-san-pham/xop-eps-dong-goi/index.html',
        'the-san-pham/xop-dang-khoi/index.html',
        'the-san-pham/goc-xop-chen-hang/index.html',
        'the-san-pham/xop-eps-xay-dung/index.html',
        'tai-khoan/index.html',
        'tai-khoan/lost-password/index.html',
        'author/aioaccount/index.html',
        'author/vinhlt/index.html',
        'minh-dang-chuyen-san-xuat-gia-cong-xop-eps-dinh-hinh-dong-goi-hang-hoa-cach-nhiet-chong-am-chong-soc/index.html',
        'huong-dan-chong-nong-hieu-qua-cho-can-nha-moi-xay-bang-chat-lieu-xop-eps/index.html',
        'tai-sao-nen-dung-xop-cach-nhiet-eps-minh-dang-cho-cong-trinh-chong-nong/index.html',
        'thi-cong-xop-eps-cach-nhiet-chong-nong-nhu-nao-de-dat-hieu-qua-toi-uu/index.html',
        'but-pha-doanh-thu-chinh-phuc-khach-hang-nho-dong-goi-van-chuyen-bang-xop-eps/index.html',
        'bi-quyet-van-chuyen-hang-hoa-di-muon-noi-ma-khong-so-be-vo-mop-meo/index.html'
    ];
    
    // Hàm fix một trang
    function fixPage(pagePath) {
        console.log('🔧 Fixing:', pagePath);
        
        // Đọc file
        var fs = require('fs');
        var path = require('path');
        
        try {
            var fullPath = path.join(__dirname, pagePath);
            if (!fs.existsSync(fullPath)) {
                console.log('❌ File không tồn tại:', pagePath);
                return false;
            }
            
            var content = fs.readFileSync(fullPath, 'utf8');
            var modified = false;
            
            // 1. Thêm mobile-fix.css nếu chưa có
            if (!content.includes('mobile-fix.css')) {
                var cssLink = '<link rel=\'stylesheet\' id=\'mobile-fix-css\' href=\'../mobile-fix.css\' type=\'text/css\' media=\'all\' />';
                content = content.replace('</head>', cssLink + '\n\t</head>');
                modified = true;
                console.log('✅ Added mobile-fix.css');
            }
            
            // 2. Thêm mobile-menu-fix.js nếu chưa có
            if (!content.includes('mobile-menu-fix.js')) {
                var jsScript = '<script type="text/javascript" src="../mobile-menu-fix.js"></script>';
                content = content.replace('</body>', '\n\t' + jsScript + '\n</body>');
                modified = true;
                console.log('✅ Added mobile-menu-fix.js');
            }
            
            // Ghi file nếu có thay đổi
            if (modified) {
                fs.writeFileSync(fullPath, content, 'utf8');
                console.log('✅ Successfully fixed', pagePath);
                return true;
            } else {
                console.log('ℹ️ No changes needed');
                return false;
            }
            
        } catch (error) {
            console.error('❌ Error:', error.message);
            return false;
        }
    }
    
    // Fix từng trang
    var totalPages = pagesToFix.length;
    var fixedPages = 0;
    var errorPages = 0;
    
    pagesToFix.forEach(function(pagePath, index) {
        console.log(`\n[${index + 1}/${totalPages}] Processing: ${pagePath}`);
        
        if (fixPage(pagePath)) {
            fixedPages++;
        } else {
            errorPages++;
        }
    });
    
    console.log('\n📊 Summary:');
    console.log(`✅ Fixed pages: ${fixedPages}`);
    console.log(`❌ Error pages: ${errorPages}`);
    console.log(`📄 Total pages: ${totalPages}`);
    console.log('🎉 Auto fix completed!');
    
})(); 