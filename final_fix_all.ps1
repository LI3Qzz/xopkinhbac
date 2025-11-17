# Script tổng hợp sửa lỗi encoding cho toàn bộ dự án

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SUA LOI ENCODING TIENG VIET" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Buoc 1: Chuyen doi encoding
Write-Host "[1/2] Chuyen doi encoding tu Windows-1252 sang UTF-8..." -ForegroundColor Yellow
& .\fix_vietnamese_encoding.ps1

Write-Host ""

# Buoc 2: Sua cac ky tu con lai
Write-Host "[2/2] Sua cac ky tu tieng Viet con lai..." -ForegroundColor Yellow
& .\fix_with_mapping.ps1

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da sua loi encoding cho toan bo cac trang HTML." -ForegroundColor Green
Write-Host "Vui long mo lai trinh duyet va nhan F5 de xem ket qua." -ForegroundColor Green
Write-Host ""
