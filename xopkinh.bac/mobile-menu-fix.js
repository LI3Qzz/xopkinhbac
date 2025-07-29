// Mobile Menu Fix - Sửa lỗi mobile menu không thể mở
(function() {
    'use strict';
    
    // Đợi DOM load xong
    document.addEventListener('DOMContentLoaded', function() {
        
        // Tìm mobile menu button
        var mobileMenuButton = document.querySelector('.nav-icon.has-icon a[data-open="#main-menu"]');
        var mobileMenu = document.getElementById('main-menu');
        
        if (mobileMenuButton && mobileMenu) {
            
            // Thêm event listener cho mobile menu button
            mobileMenuButton.addEventListener('click', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                // Toggle mobile menu
                toggleMobileMenu();
            });
            
            // Thêm event listener cho touch events
            mobileMenuButton.addEventListener('touchstart', function(e) {
                e.preventDefault();
                e.stopPropagation();
                
                // Toggle mobile menu
                toggleMobileMenu();
            });
            
            // Hàm toggle mobile menu
            function toggleMobileMenu() {
                if (mobileMenu.classList.contains('mfp-hide')) {
                    // Mở menu
                    mobileMenu.classList.remove('mfp-hide');
                    mobileMenu.style.display = 'block';
                    mobileMenu.style.visibility = 'visible';
                    mobileMenu.style.opacity = '1';
                    mobileMenu.style.zIndex = '999999';
                    
                    // Thêm overlay
                    addOverlay();
                    
                    // Thêm close button
                    addCloseButton();
                    
                    // Disable body scroll
                    document.body.style.overflow = 'hidden';
                    
                } else {
                    // Đóng menu
                    closeMobileMenu();
                }
            }
            
            // Hàm đóng mobile menu
            function closeMobileMenu() {
                mobileMenu.classList.add('mfp-hide');
                mobileMenu.style.display = 'none';
                mobileMenu.style.visibility = 'hidden';
                mobileMenu.style.opacity = '0';
                
                // Xóa overlay
                removeOverlay();
                
                // Enable body scroll
                document.body.style.overflow = '';
            }
            
            // Thêm overlay
            function addOverlay() {
                var overlay = document.createElement('div');
                overlay.id = 'mobile-menu-overlay';
                overlay.style.cssText = `
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    background: rgba(0,0,0,0.5);
                    z-index: 999998;
                    cursor: pointer;
                `;
                
                overlay.addEventListener('click', function() {
                    closeMobileMenu();
                });
                
                document.body.appendChild(overlay);
            }
            
            // Xóa overlay
            function removeOverlay() {
                var overlay = document.getElementById('mobile-menu-overlay');
                if (overlay) {
                    overlay.remove();
                }
            }
            
            // Thêm close button
            function addCloseButton() {
                var closeButton = document.createElement('button');
                closeButton.innerHTML = '×';
                closeButton.style.cssText = `
                    position: absolute;
                    top: 15px;
                    right: 15px;
                    width: 40px;
                    height: 40px;
                    background: #333;
                    color: white;
                    border: none;
                    border-radius: 50%;
                    cursor: pointer;
                    font-size: 24px;
                    line-height: 1;
                    z-index: 1000000;
                `;
                
                closeButton.addEventListener('click', function() {
                    closeMobileMenu();
                });
                
                mobileMenu.appendChild(closeButton);
            }
            
            // Thêm CSS cho mobile menu
            var style = document.createElement('style');
            style.textContent = `
                @media (max-width: 849px) {
                    #main-menu.mobile-sidebar {
                        position: fixed !important;
                        top: 0 !important;
                        left: 0 !important;
                        width: 100% !important;
                        height: 100% !important;
                        background: rgba(0,0,0,0.8) !important;
                        z-index: 999999 !important;
                        display: flex !important;
                        align-items: center !important;
                        justify-content: center !important;
                    }
                    
                    #main-menu .sidebar-menu {
                        background: white !important;
                        width: 80% !important;
                        max-width: 300px !important;
                        height: 80% !important;
                        overflow-y: auto !important;
                        border-radius: 8px !important;
                        padding: 20px !important;
                        position: relative !important;
                    }
                    
                    #main-menu .nav-sidebar li a {
                        display: block !important;
                        padding: 15px 20px !important;
                        border-bottom: 1px solid #eee !important;
                        color: #333 !important;
                        text-decoration: none !important;
                        font-size: 16px !important;
                        line-height: 1.4 !important;
                        cursor: pointer !important;
                    }
                    
                    #main-menu .nav-sidebar li a:hover {
                        background-color: #f5f5f5 !important;
                        color: #000 !important;
                    }
                    
                    .nav-icon.has-icon {
                        display: block !important;
                        visibility: visible !important;
                        opacity: 1 !important;
                        pointer-events: auto !important;
                    }
                    
                    .nav-icon.has-icon a {
                        cursor: pointer !important;
                        pointer-events: auto !important;
                        min-width: 44px !important;
                        min-height: 44px !important;
                        padding: 10px !important;
                        display: flex !important;
                        align-items: center !important;
                        justify-content: center !important;
                    }
                    
                    .nav-icon.has-icon i.icon-menu {
                        display: inline-block !important;
                        visibility: visible !important;
                        opacity: 1 !important;
                        font-size: 20px !important;
                        color: #333 !important;
                    }
                }
                
                @media (max-width: 549px) {
                    #main-menu .sidebar-menu {
                        width: 90% !important;
                        max-width: none !important;
                    }
                    
                    #main-menu .nav-sidebar li a {
                        padding: 18px 20px !important;
                        font-size: 18px !important;
                    }
                }
            `;
            document.head.appendChild(style);
        }
        
        // Thêm fallback cho trường hợp JavaScript bị lỗi
        setTimeout(function() {
            if (mobileMenuButton && !mobileMenuButton.hasAttribute('data-fixed')) {
                mobileMenuButton.setAttribute('data-fixed', 'true');
                
                // Thêm CSS inline để đảm bảo button luôn hiển thị
                mobileMenuButton.style.cssText += `
                    display: block !important;
                    visibility: visible !important;
                    opacity: 1 !important;
                    pointer-events: auto !important;
                    cursor: pointer !important;
                    min-width: 44px !important;
                    min-height: 44px !important;
                    padding: 10px !important;
                `;
            }
        }, 1000);
    });
    
    // Thêm event listener cho window resize
    window.addEventListener('resize', function() {
        var mobileMenu = document.getElementById('main-menu');
        if (window.innerWidth > 849 && mobileMenu) {
            // Đóng menu khi chuyển sang desktop
            mobileMenu.classList.add('mfp-hide');
            mobileMenu.style.display = 'none';
            mobileMenu.style.visibility = 'hidden';
            mobileMenu.style.opacity = '0';
            
            // Xóa overlay
            var overlay = document.getElementById('mobile-menu-overlay');
            if (overlay) {
                overlay.remove();
            }
            
            // Enable body scroll
            document.body.style.overflow = '';
        }
    });
    
})(); 