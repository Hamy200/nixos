HYPRSHOT_DIR=/tmp hyprshot -m region -f ocr.png -s
tesseract -l jpn /tmp/ocr.png /tmp/ocr
truncate -s -1 /tmp/ocr.txt
cat /tmp/ocr.txt | wl-copy -n
