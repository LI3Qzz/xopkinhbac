#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script để tự động sửa navigation và search form trong website XỐP KINH BẮC
"""

import os
import re
from pathlib import Path

def fix_search_forms(file_path):
    """Sửa search form action từ external domain sang local path"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Đếm số lần thay thế
        original_count = content.count('action="https://xopkinhbac.com/"')
        
        # Thay thế search form action
        content = content.replace('action="https://xopkinhbac.com/"', 'action="../index.html"')
        
        # Nếu có thay đổi, ghi lại file
        if original_count > 0:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"✅ Đã sửa {original_count} search form trong {file_path}")
            return True
        return False
    except Exception as e:
        print(f"❌ Lỗi khi sửa {file_path}: {e}")
        return False

def add_hinh_anh_xuong_link(file_path):
    """Thêm link 'HÌNH ẢNH NHÀ XƯỞNG' vào navigation"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Pattern để tìm navigation menu
        nav_patterns = [
            # Desktop navigation
            r'(<li id="menu-item-241"[^>]*><a[^>]*>Dịch Vụ</a></li>\s*<li id="menu-item-242"[^>]*><a[^>]*>Tin Tức</a></li>\s*<li id="menu-item-250"[^>]*><a[^>]*>Liên Hệ</a></li>)',
            r'(<li id="menu-item-241"[^>]*><a[^>]*>Dịch Vụ</a></li>\s*<li id="menu-item-250"[^>]*><a[^>]*>Liên Hệ</a></li>)',
            # Mobile navigation
            r'(<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>\s*<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-242"><a[^>]*>Tin Tức</a></li>\s*<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-250"><a[^>]*>Liên Hệ</a></li>)',
            r'(<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>\s*<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-250"><a[^>]*>Liên Hệ</a></li>)',
        ]
        
        hinh_anh_link = '<li id="menu-item-999" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-999 menu-item-design-default"><a href="../hinh-anh-xuong/index.html" class="nav-top-link">HÌNH ẢNH NHÀ XƯỞNG</a></li>'
        hinh_anh_mobile_link = '<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-999"><a href="../hinh-anh-xuong/index.html">HÌNH ẢNH NHÀ XƯỞNG</a></li>'
        
        changes_made = False
        
        for pattern in nav_patterns:
            if re.search(pattern, content):
                # Thêm link vào sau "Dịch Vụ"
                replacement = re.sub(
                    r'(<li[^>]*>Dịch Vụ</a></li>)',
                    r'\1\n' + hinh_anh_link,
                    content
                )
                if replacement != content:
                    content = replacement
                    changes_made = True
                
                # Thêm link vào mobile menu
                replacement = re.sub(
                    r'(<li class="menu-item menu-item-type-taxonomy menu-item-object-category menu-item-241"><a[^>]*>Dịch Vụ</a></li>)',
                    r'\1\n' + hinh_anh_mobile_link,
                    content
                )
                if replacement != content:
                    content = replacement
                    changes_made = True
        
        if changes_made:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(content)
            print(f"✅ Đã thêm link HÌNH ẢNH NHÀ XƯỞNG vào {file_path}")
            return True
        return False
    except Exception as e:
        print(f"❌ Lỗi khi thêm link vào {file_path}: {e}")
        return False

def process_html_files():
    """Xử lý tất cả file HTML trong thư mục xopkinh.bac"""
    base_path = Path("xopkinh.bac")
    
    if not base_path.exists():
        print("❌ Không tìm thấy thư mục xopkinh.bac")
        return
    
    # Tìm tất cả file HTML
    html_files = list(base_path.rglob("*.html"))
    
    print(f"🔍 Tìm thấy {len(html_files)} file HTML")
    
    search_fixed = 0
    nav_fixed = 0
    
    for file_path in html_files:
        # Bỏ qua các file đặc biệt
        if any(skip in str(file_path) for skip in ['wp-content/uploads', 'wp-json', 'feed']):
            continue
            
        print(f"📄 Đang xử lý: {file_path}")
        
        # Sửa search form
        if fix_search_forms(file_path):
            search_fixed += 1
        
        # Thêm link navigation
        if add_hinh_anh_xuong_link(file_path):
            nav_fixed += 1
    
    print(f"\n📊 Tổng kết:")
    print(f"   - Đã sửa search form trong {search_fixed} file")
    print(f"   - Đã thêm link navigation trong {nav_fixed} file")
    print(f"   - Tổng cộng xử lý {len(html_files)} file")

if __name__ == "__main__":
    print("🚀 Bắt đầu sửa navigation và search form...")
    process_html_files()
    print("✅ Hoàn thành!") 