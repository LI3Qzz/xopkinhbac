# Script thêm button Zalo và Email vào tất cả file HTML

$htmlFiles = Get-ChildItem -Path "xopkinh.bac" -Filter "*.html" -Recurse

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  THEM BUTTON ZALO VA EMAIL" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tim thay $($htmlFiles.Count) file HTML"
Write-Host ""

# CSS cho button group
$newCSS = @"
<style>
/* Floating Buttons Group */
.floating-buttons-group {
    position: fixed;
    bottom: 20px;
    right: 20px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    z-index: 9999;
    opacity: 0;
    transform: translateY(100px);
    transition: all 0.3s ease;
}

.floating-buttons-group.show {
    opacity: 1;
    transform: translateY(0);
}

.floating-btn {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
}

.floating-btn:hover {
    transform: translateY(-5px) scale(1.05);
    box-shadow: 0 6px 20px rgba(0,0,0,0.25);
}

.floating-btn a {
    color: white;
    font-size: 28px;
    text-decoration: none;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
}

.floating-btn.phone {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.floating-btn.zalo {
    background: linear-gradient(135deg, #0068FF 0%, #0180F7 100%);
}

.floating-btn.email {
    background: linear-gradient(135deg, #EA4335 0%, #E91E63 100%);
}

.floating-btn::before {
    content: '';
    position: absolute;
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background: inherit;
    animation: pulse 2s infinite;
    z-index: -1;
}

@keyframes pulse {
    0% {
        transform: scale(1);
        opacity: 1;
    }
    50% {
        transform: scale(1.1);
        opacity: 0.7;
    }
    100% {
        transform: scale(1);
        opacity: 1;
    }
}

@media (max-width: 768px) {
    .floating-buttons-group {
        bottom: 15px;
        right: 15px;
        gap: 12px;
    }
    .floating-btn {
        width: 55px;
        height: 55px;
    }
    .floating-btn a {
        font-size: 24px;
    }
}
</style>
"@

# HTML cho button group
$newHTML = @"
<!-- Floating Buttons Group -->
<div class="floating-buttons-group" id="floatingBtnsGroup">
    <!-- Phone Button -->
    <div class="floating-btn phone">
        <a href="tel:0337154318" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/call'});" title="Gọi điện: 0337154318">
            📞
        </a>
    </div>
    
    <!-- Zalo Button -->
    <div class="floating-btn zalo">
        <a href="https://zalo.me/0337154318" target="_blank" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/zalo'});" title="Chat Zalo: 0337154318">
            💬
        </a>
    </div>
    
    <!-- Email Button -->
    <div class="floating-btn email">
        <a href="mailto:nhuaxopkinhbac@gmail.com" onclick="gtag('event', 'conversion', {'send_to': 'AW-17732698416/email'});" title="Email: nhuaxopkinhbac@gmail.com">
            ✉️
        </a>
    </div>
</div>

<script>
// Show/hide floating buttons on scroll
window.addEventListener('scroll', function() {
    var floatingBtns = document.getElementById('floatingBtnsGroup');
    if (window.pageYOffset > 300) {
        floatingBtns.classList.add('show');
    } else {
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
        
        # Xoa button cu neu co
        if ($content -match '<!-- Floating Call Button -->.*?</script>') {
            $content = $content -replace '(?s)<!-- Floating Call Button -->.*?</script>', ''
            $changed = $true
        }
        
        # Xoa CSS cu neu co
        if ($content -match '/\* Floating Call Button \*/.*?</style>') {
            $content = $content -replace '(?s)/\* Floating Call Button \*/.*?</style>', '</style>'
            $changed = $true
        }
        
        # Them CSS moi vao truoc </head>
        if (-not $content.Contains('floating-buttons-group')) {
            if ($content -match '</head>') {
                $content = $content -replace '</head>', "$newCSS`n</head>"
                $changed = $true
            }
        }
        
        # Them HTML moi vao truoc </body>
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
Write-Host "Da them code vao: $modified file" -ForegroundColor Green
Write-Host ""
Write-Host "Da them 3 button troi noi:" -ForegroundColor Cyan
Write-Host "  - Goi dien: 0337154318" -ForegroundColor Cyan
Write-Host "  - Zalo: 0337154318" -ForegroundColor Cyan
Write-Host "  - Email: nhuaxopkinhbac@gmail.com" -ForegroundColor Cyan
Write-Host "  - Tat ca deu tracking qua Google Ads" -ForegroundColor Cyan
Write-Host ""
