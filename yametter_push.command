#!/bin/bash
cd ~/Library/CloudStorage/Dropbox/Yametter_LP
git add .
git commit -m "update $(date '+%Y-%m-%d %H:%M')"
git push
echo ""
echo "✅ Push完了！"
read -p "Enterキーで閉じる..."
