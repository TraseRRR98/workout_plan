#!/bin/bash

# Assume current directory is 'assets'

echo "Downloading Bootstrap CSS..."
curl -s -o bootstrap.min.css https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css

echo "Downloading Bootstrap JS Bundle..."
curl -s -o bootstrap.bundle.min.js https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js

echo "Downloading jQuery Slim..."
curl -s -o jquery-3.7.1.slim.min.js https://code.jquery.com/jquery-3.7.1.slim.min.js

echo "Downloading Font Awesome CSS..."
curl -s -o all.min.css https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css

echo "Extracting and downloading Font Awesome font files..."
# Extract font URLs from the CSS file
grep -o 'url([^)]*)' all.min.css | sed 's/url(//;s/)//;s/\"//g' | while read -r url; do
    # Ensure URLs are absolute
    if [[ $url != http* ]]; then
        url="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/$url"
    fi
    # Create the necessary directories if they don't exist
    dir=$(dirname "$url" | sed 's|https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/||')
    if [[ $dir != "." ]]; then
        mkdir -p "$dir"
    fi
    # Download the font file
    filename=$(basename "$url")
    echo "Downloading $filename..."
    curl -s -o "$dir/$filename" "$url"
done

echo "All files have been downloaded to the current directory."

