# Script sửa lại floating buttons với icon đúng và layout tốt hơn

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SUA LAI FLOATING BUTTONS" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host ""

# CSS mới với icon tốt hơn
$newCSS = @"
<style>
/* Floating Buttons Group */
.floating-buttons-group {
    position: fixed;
    bottom: 80px;
    right: 20px;
    display: flex;
    flex-direction: column;
    gap: 12px;
    z-index: 9998;
    opacity: 0;
    transform: translateX(100px);
    transition: all 0.4s ease;
}

.floating-buttons-group.show {
    opacity: 1;
    transform: translateX(0);
}

.floating-btn {
    width: 56px;
    height: 56px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
}

.floating-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 20px rgba(0,0,0,0.3);
}

.floating-btn a {
    color: white;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    font-size: 24px;
}

.floating-btn.phone {
    background: linear-gradient(135deg, #25D366 0%, #128C7E 100%);
}

.floating-btn.zalo {
    background: linear-gradient(135deg, #0068FF 0%, #0180F7 100%);
}

.floating-btn.email {
    background: linear-gradient(135deg, #EA4335 0%, #C5221F 100%);
}

@media (max-width: 768px) {
    .floating-buttons-group {
        bottom: 70px;
        right: 15px;
        gap: 10px;
    }
    .floating-btn {
        width: 50px;
        height: 50px;
    }
    .floating-btn a {
        font-size: 20px;
    }
}
</style>
"@

# HTML mới với SVG icons
$newHTML = @"
<!-- Floating Buttons Group -->
<div class="floating-buttons-group" id="floatingBtnsGroup">
    <!-- Phone Button -->
    <div class="floating-btn phone" title="Gọi: 0337154318">
        <a href="tel:0337154318" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/call'});">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="white"><path d="M20.01 15.38c-1.23 0-2.42-.2-3.53-.56-.35-.12-.74-.03-1.01.24l-1.57 1.97c-2.83-1.35-5.48-3.9-6.89-6.83l1.95-1.66c.27-.28.35-.67.24-1.02-.37-1.11-.56-2.3-.56-3.53 0-.54-.45-.99-.99-.99H4.19C3.65 3 3 3.24 3 3.99 3 13.28 10.73 21 20.01 21c.71 0 .99-.63.99-1.18v-3.45c0-.54-.45-.99-.99-.99z"/></svg>
        </a>
    </div>
    
    <!-- Zalo Button -->
    <div class="floating-btn zalo" title="Chat Zalo: 0337154318">
        <a href="https://zalo.me/0337154318" target="_blank" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/zalo'});">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="white"><path d="M12 2C6.48 2 2 6.48 2 12c0 1.54.36 3 .97 4.29L2 22l5.71-.97C9 21.64 10.46 22 12 22c5.52 0 10-4.48 10-10S17.52 2 12 2zm0 18c-1.38 0-2.68-.31-3.85-.85l-.28-.14-2.85.48.48-2.85-.14-.28C4.31 14.68 4 13.38 4 12c0-4.41 3.59-8 8-8s8 3.59 8 8-3.59 8-8 8z"/><path d="M8 10h2v5H8zm3 0h2v5h-2zm3 0h2v5h-2z"/></svg>
        </a>
    </div>
    
    <!-- Email Button -->
    <div class="floating-btn email" title="Email: nhuaxopkinhbac@gmail.com">
        <a href="mailto:nhuaxopkinhbac@gmail.com" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/email'});">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="white"><path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>
        </a>
    </div>
</div>

<script>
// Show/hide floating buttons on scroll
window.addEventListener('scroll', function() {
    var floatingBtns = document.getElementById('floatingBtnsGroup');
    if (floatingBtns && window.pageYOffset > 300) {
        floatingBtns.classList.add('show');
    } else if (floatingBtns) {
        floatingBtns.classList.remove('show');
    }
});
</script>
"@

$count = 0
$modified = 0

foreach ($file in $htmlFiles) {
    try {
        # Doc file
        $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        
        $changed = $false
        
        # Xoa button group cu (ca 2 version)
        if ($content -match '<!-- Floating Call Button -->') {
            $content = $content -replace '(?s)<!-- Floating Call Button -->.*?</script>', ''
            $changed = $true
        }
        
        if ($content -match '<!-- Floating Buttons Group -->') {
            $content = $content -replace '(?s)<!-- Floating Buttons Group -->.*?</script>', ''
            $changed = $true
        }
        
        # Xoa CSS cu (ca 2 version)
        if ($content -match '/\* Floating Call Button \*/') {
            $content = $content -replace '(?s)/\* Floating Call Button \*/.*?</style>', '</style>'
            $changed = $true
        }
        
        if ($content -match '/\* Floating Buttons Group \*/') {
            $content = $content -replace '(?s)/\* Floating Buttons Group \*/.*?</style>', '</style>'
            $changed = $true
        }
        
        # Them CSS moi
        if (-not $content.Contains('floating-buttons-group')) {
            if ($content -match '</head>') {
                $content = $content -replace '</head>', "$newCSS`n</head>"
                $changed = $true
            }
        }
        
        # Them HTML moi
        if (-not $content.Contains('id="floatingBtnsGroup"')) {
            if ($content -match '</body>') {
                $content = $content -replace '</body>', "$newHTML`n</body>"
                $changed = $true
            }
        }
        
        if ($changed) {
            # Luu file
            $utf8 = New-Object System.Text.UTF8Encoding $true
            [System.IO.File]::WriteAllText($file.FullName, $content, $utf8)
            
            $modified++
            Write-Host "  [+] Da sua: $($file.Name)" -ForegroundColor Green
        }
        
        $count++
        if ($count % 50 -eq 0) {
            Write-Host "  Da xu ly $count file..." -ForegroundColor Yellow
        }
    }
    catch {
        Write-Host "  [!] Loi: $($file.Name) - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  HOAN THANH!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Da xu ly: $count file" -ForegroundColor Green
Write-Host "Da sua: $modified file" -ForegroundColor Green
Write-Host ""
Write-Host "Cai tien:" -ForegroundColor Cyan
Write-Host "  - Icon SVG ro rang, khong bi loi encoding" -ForegroundColor Cyan
Write-Host "  - Layout doc, khong bi de len nhau" -ForegroundColor Cyan
Write-Host "  - Hieu ung slide tu ben phai" -ForegroundColor Cyan
Write-Host "  - Vi tri cao hon de tranh bi che" -ForegroundColor Cyan
Write-Host ""
