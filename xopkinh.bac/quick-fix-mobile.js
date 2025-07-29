// Quick Fix Mobile Menu - Fix nhanh cho các trang chính
(function() {
    'use strict';
    
    console.log('🔧 Quick Fix Mobile Menu - Bắt đầu...');
    
    // Danh sách các trang chính cần fix ngay
    var priorityPages = [
        'index.html',
        've-chung-toi/index.html',
        'dich-vu/index.html',
        'tin-tuc/index.html',
        'lien-he/index.html',
        'blox-dang-khoi/index.html',
        'xop-eps-dinh-hinh/index.html',
        'ton-nen-chong-nong-trong-xay-dung/index.html',
        'hang-dong-goi/index.html'
    ];
    
    // Hàm fix một trang cụ thể
    function fixSpecificPage(pagePath) {
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
            
            // 3. Thêm mobile menu nếu chưa có
            if (!content.includes('id="main-menu"')) {
                var mobileMenu = `
	<!-- Mobile Menu -->
	<div id="main-menu" class="mobile-sidebar no-scrollbar mfp-hide">
		<div class="sidebar-menu no-scrollbar ">
			<ul class="nav nav-sidebar nav-vertical nav-uppercase" data-tab="1">
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-239"><a href="../index.html">TRANG CHỦ</a></li>
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-240"><a href="../ve-chung-toi/index.html">VỀ CHÚNG TÔI</a></li>
				<li class="menu-item menu-item-type-custom menu-item-object-custom menu-item-has-children menu-item-246"><a href="#">SẢN PHẨM XỐP EPS</a>
					<ul class="sub-menu nav-sidebar-ul children">
						<li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-243"><a href="../blox-dang-khoi/index.html">Blox Dạng Khối</a></li>
						<li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-244"><a href="../xop-eps-dinh-hinh/index.html">XỐP EPS ĐỊNH HÌNH</a></li>
						<li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-245"><a href="../ton-nen-chong-nong-trong-xay-dung/index.html">Tôn nền chống nóng trong xây dựng</a></li>
						<li class="menu-item menu-item-type-taxonomy menu-item-object-product_cat menu-item-435"><a href="../hang-dong-goi/index.html">Hàng Đóng Gói</a></li>
					</ul>
				</li>
				<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a href="../dich-vu/index.html">Dịch Vụ</a></li>
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-999"><a href="../hinh-anh-xuong/index.html">HÌNH ẢNH NHÀ XƯỞNG</a></li>
				<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-242"><a href="../tin-tuc/index.html">Tin Tức</a></li>
				<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-250"><a href="../lien-he/index.html">Liên Hệ</a></li>
			</ul>
		</div>
	</div>`;
                
                content = content.replace('</main>', '</main>\n\n\t' + mobileMenu);
                modified = true;
                console.log('✅ Added mobile menu');
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
    priorityPages.forEach(function(pagePath, index) {
        console.log(`\n[${index + 1}/${priorityPages.length}] Processing: ${pagePath}`);
        fixSpecificPage(pagePath);
    });
    
    console.log('\n🎉 Quick fix completed!');
    
})(); 