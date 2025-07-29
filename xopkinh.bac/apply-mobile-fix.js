// Script để áp dụng mobile menu fix cho tất cả các trang
(function() {
    'use strict';
    
    // Tìm tất cả các file HTML trong thư mục
    function findHTMLFiles() {
        // Đây là danh sách các file HTML cần sửa
        const htmlFiles = [
            'index.html',
            've-chung-toi/index.html',
            'dich-vu/index.html',
            'tin-tuc/index.html',
            'lien-he/index.html',
            'tai-khoan/index.html',
            'tai-khoan/lost-password/index.html',
            'the-san-pham/xop-eps/index.html',
            'the-san-pham/xop-eps-dang-khoi/index.html',
            'the-san-pham/xop-eps-dinh-hinh/index.html',
            'the-san-pham/xop-eps-dinh-hinh-dong-goi/index.html',
            'the-san-pham/xop-eps-dinh-hinh-dong-hang/index.html',
            'the-san-pham/xop-eps-dong-goi/index.html',
            'the-san-pham/xop-eps-dong-hang/index.html',
            'the-san-pham/xop-eps-xay-dung/index.html',
            'the-san-pham/goc-xop-chen-hang/index.html',
            'the-san-pham/goc-xop-eps-chen-hang/index.html',
            'xop-eps-dang-khoi/index.html',
            'xop-eps-dang-khoi-m1/index.html',
            'xop-eps-dang-khoi-m2/index.html',
            'xop-eps-dang-khoi-m3/index.html',
            'xop-eps-dang-khoi-m4/index.html',
            'xop-eps-dang-khoi-m5/index.html',
            'xop-eps-dang-khoi-m6/index.html',
            'xop-eps-dang-khoi-m7/index.html',
            'xop-eps-dinh-hinh/index.html',
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
            'xop-eps-dinh-hinh-dong-goi-tuong/index.html',
            'xop-eps-dinh-hinh-dong-hang-trang-tri/index.html',
            'xop-eps-dinh-hinh-hop-dong-hang/index.html',
            'xop-eps-don-nen/index.html',
            'xop-eps-dong-goi-hang-hoa/index.html',
            'xop-eps-dong-goi-thiet-bi/index.html',
            'xop-eps-kinh-bac/index.html',
            'xop-eps-kinh-bac-chong-nang-cach-nhiet-giai-phap-hieu-qua-bao-ve-cong-trinh-khoi-tac-dong-mat-troi/index.html',
            'xop-eps-kinh-bac-chong-soc-cach-nhiet-tiet-kiem-chi-phi/index.html',
            'xop-eps-kinh-bac-giai-phap-dong-goi-hoan-hao-nang-tam-gia-tri-doanh-nghiep-cua-ban/index.html',
            'xop-eps-kinh-bac-giai-phap-toi-uu-cho-moi-cong-trinh/index.html',
            'xop-eps-ton-nen/index.html',
            'xop-eps-ton-nen-minh-dang-giai-phap-toi-uu-cho-moi-cong-trinh-xay-dung/index.html',
            'blox-dang-khoi/index.html',
            'hang-dong-goi/index.html',
            'goc-xop-eps-chen-hang/index.html',
            'goc-xop-eps-dinh-hinh-dong-hang/index.html',
            'goc-xop-eps-dinh-hinh-loai-dai/index.html',
            'ton-nen-chong-nong-trong-xay-dung/index.html',
            'thi-cong-xop-eps-cach-nhiet-chong-nong-nhu-nao-de-dat-hieu-qua-toi-uu/index.html',
            'tai-sao-nen-dung-xop-cach-nhiet-eps-minh-dang-cho-cong-trinh-chong-nong/index.html',
            'huong-dan-chong-nong-hieu-qua-cho-can-nha-moi-xay-bang-chat-lieu-xop-eps/index.html',
            'but-pha-doanh-thu-chinh-phuc-khach-hang-nho-dong-goi-van-chuyen-bang-xop-eps/index.html',
            'bi-quyet-van-chuyen-hang-hoa-di-muon-noi-ma-khong-so-be-vo-mop-meo/index.html',
            'minh-dang-chuyen-san-xuat-gia-cong-xop-eps-dinh-hinh-dong-goi-hang-hoa-cach-nhiet-chong-am-chong-soc/index.html',
            'author/aioaccount/index.html',
            'author/vinhlt/index.html'
        ];
        
        return htmlFiles;
    }
    
    // Hàm để thêm script vào file HTML
    function addScriptToHTML(filePath) {
        const fs = require('fs');
        const path = require('path');
        
        try {
            // Đọc file HTML
            let htmlContent = fs.readFileSync(filePath, 'utf8');
            
            // Kiểm tra xem script đã được thêm chưa
            if (htmlContent.includes('mobile-menu-fix.js')) {
                console.log(`Script đã tồn tại trong ${filePath}`);
                return;
            }
            
            // Tìm vị trí để thêm script (trước thẻ đóng body)
            const bodyCloseIndex = htmlContent.lastIndexOf('</body>');
            
            if (bodyCloseIndex !== -1) {
                // Thêm script trước thẻ đóng body
                const scriptTag = '\n<script type="text/javascript" src="mobile-menu-fix.js"></script>\n';
                htmlContent = htmlContent.slice(0, bodyCloseIndex) + scriptTag + htmlContent.slice(bodyCloseIndex);
                
                // Ghi lại file
                fs.writeFileSync(filePath, htmlContent, 'utf8');
                console.log(`Đã thêm script vào ${filePath}`);
            } else {
                console.log(`Không tìm thấy thẻ </body> trong ${filePath}`);
            }
            
        } catch (error) {
            console.error(`Lỗi khi xử lý file ${filePath}:`, error.message);
        }
    }
    
    // Hàm chính để áp dụng fix
    function applyMobileFix() {
        const htmlFiles = findHTMLFiles();
        
        htmlFiles.forEach(filePath => {
            addScriptToHTML(filePath);
        });
        
        console.log('Đã áp dụng mobile menu fix cho tất cả các trang!');
    }
    
    // Chạy script nếu được gọi trực tiếp
    if (typeof module !== 'undefined' && module.exports) {
        module.exports = { applyMobileFix, addScriptToHTML };
    } else {
        // Chạy trong browser
        applyMobileFix();
    }
    
})(); 