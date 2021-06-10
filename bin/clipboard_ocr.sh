xclip -selection clipboard -target image/png -out > /tmp/clipboard_ocr_img.png

tesseract /tmp/clipboard_ocr_img.png /tmp/clipboard_ocr_txt

cat /tmp/clipboard_ocr_txt.txt | xclip -sel clip

notify-send "Clipboard OCR" "Extracted text copied to clipboard!"
