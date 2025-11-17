# Script sửa các ký tự tiếng Việt còn lại bị lỗi sử dụng file mapping

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "Tim thay $($htmlFiles.Count) file HTML"

# Doc file mapping
$mappingFile = "char_mapping.txt"
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

Write-Host "Da load $($mappings.Count) mapping"
Write-Host "Dang sua cac ky tu con lai..."

$count = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file voi UTF-8
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $modified = $false
        
        # Thay the cac ky tu loi
        foreach ($mapping in $mappings) {
            $from = $mapping.From
            $to = $mapping.To
            
            if ($content.Contains($from)) {
                $content = $content.Replace($from, $to)
                $modified = $true
            }
        }
        
        if ($modified) {
            # Luu lai voi UTF-8 BOM
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
            $count++
            if ($count % 50 -eq 0) {
                Write-Host "Da xu ly $count file..."
            }
        }
    }
    catch {
        Write-Host "Loi khi xu ly file: $($file.Name)" -ForegroundColor Yellow
        Write-Host $_.Exception.Message -ForegroundColor Yellow
    }
}

Write-Host "`nHoan thanh! Da sua $count file HTML" -ForegroundColor Green
Write-Host "Vui long mo lai trinh duyet de xem ket qua"
