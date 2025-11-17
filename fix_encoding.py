#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script sửa lỗi encoding UTF-8 cho tất cả file HTML
Chuyển đổi từ Latin-1/Windows-1252 sang UTF-8
"""

import os
import glob

def fix_encoding(file_path):
    """Sửa encoding của một file"""
    try:
        # Thử đọc với các encoding khác nhau
        encodings = ['latin-1', 'cp1252', 'iso-8859-1']
        content = None
        
        for enc in encodings:
            try:
                with open(file_path, 'r', encoding=enc) as f:
                    content = f.read()
                break
            except:
                continue
        
        if content is None:
            print(f"Không thể đọc file: {file_path}")
            return False
        
        # Lưu lại với UTF-8 BOM
        with open(file_path, 'w', encoding='utf-8-sig') as f:
            f.write(content)
        
        return True
    except Exception as e:
        print(f"Lỗi khi xử lý {file_path}: {str(e)}")
        return False

def main():
    # Tìm tất cả file HTML trong thư mục xopkinh.bac
    html_files = glob.glob('xopkinh.bac/**/*.html', recursive=True)
    
    print(f"Tìm thấy {len(html_files)} file HTML")
    print("Đang sửa encoding...")
    
    count = 0
    for file_path in html_files:
        if fix_encoding(file_path):
            count += 1
            if count % 50 == 0:
                print(f"Đã xử lý {count} file...")
    
    print(f"\nHoàn thành! Đã sửa {count}/{len(html_files)} file HTML")

if __name__ == "__main__":
    main()
