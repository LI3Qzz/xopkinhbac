# Script áp dụng mapping từ file

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SUA LOI ENCODING TIENG VIET" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Đọc file mapping
$mappingFile = "mappings.txt"
if (-not (Test-Path $mappingFile)) {
    Write-Host "Khong tim thay file $mappingFile" -ForegroundColor Red
    exit
}

$mappings = @()
Get-Content $mappingFile -Encoding UTF8 | ForEach-Object {
    $parts = $_ -split '\|'
    if ($parts.Length -eq 2) {
        $mappings += @{
            From = $parts[0]
            To = $parts[1]
        }
    }
}

Write-Host "Da load $($mappings.Count) mapping" -ForegroundColor Green
Write-Host "Tim thay $($htmlFiles.Count) file HTML" -ForegroundColor Green
Write-Host ""
Write-Host "Dang sua loi..." -ForegroundColor Yellow
Write-Host ""

$count = 0
$totalFixed = 0

foreach ($file in $htmlFiles) {
    try {
        # Đọc file với UTF-8
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay thế các ký tự lỗi
        foreach ($mapping in $mappings) {
            $from = $mapping.From
            $to = $mapping.To
            
            if ($content.Contains($from)) {
                $content = $content.Replace($from, $to)
                $modified = $true
            }
        }
        
        if ($modified) {
            # Lưu lại với UTF-8 BOM
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
            $totalFixed++
        }
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "  [+] Da xu ly $count file..." -ForegroundColor Green
        }
    }
    catch {
        Write-Host "  [!] Loi: $($file.Name)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da xu ly: $count file" -ForegroundColor Green
Write-Host "Da sua: $totalFixed file" -ForegroundColor Green
Write-Host ""
Write-Host "Vui long mo lai trinh duyet va nhan Ctrl+F5" -ForegroundColor Cyan
Write-Host ""
