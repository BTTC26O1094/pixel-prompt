$images = @{
    'hero_stationery.jpg' = 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=1200&q=85';
    'product_journal.jpg' = 'https://images.unsplash.com/photo-1544816155-12df9643f363?auto=format&fit=crop&w=800&q=85';
    'product_pencils.jpg' = 'https://images.unsplash.com/photo-1583485088034-697b5bc54ccd?auto=format&fit=crop&w=800&q=85';
    'product_seed_cards.jpg' = 'https://images.unsplash.com/photo-1516962215378-7fa2e137ae93?auto=format&fit=crop&w=800&q=85';
    'story_artisan.jpg' = 'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?auto=format&fit=crop&w=1000&q=85';
    'desk_texture.jpg' = 'https://images.unsplash.com/photo-1517842645767-c639042777db?auto=format&fit=crop&w=1200&q=85'
}

if (!(Test-Path "assets/images")) {
    New-Item -ItemType Directory -Path "assets/images" -Force | Out-Null
}

foreach ($key in $images.Keys) {
    $url = $images[$key]
    $dest = "assets/images/$key"
    Write-Output "Downloading $key..."
    Invoke-WebRequest -Uri $url -OutFile $dest
}

Get-ChildItem "assets/images" | Select-Object Name, Length
