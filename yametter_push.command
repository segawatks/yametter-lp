#!/bin/bash
cd ~/Library/CloudStorage/Dropbox/Yametter_LP

# ロックファイルを自動削除
rm -f .git/HEAD.lock .git/index.lock .git/refs/heads/*.lock 2>/dev/null

git add .
git commit -m "update $(date '+%Y-%m-%d %H:%M')"
git push
echo ""
echo "✅ Push完了！"
read -p "Enterキーで閉じる..."
