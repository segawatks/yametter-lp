#!/bin/bash

TARGET_HOUR=18
TARGET_MIN=0

NOW=$(date +%s)
TARGET=$(date -j -f "%H:%M:%S" "${TARGET_HOUR}:${TARGET_MIN}:00" +%s 2>/dev/null)

WAIT=$((TARGET - NOW))

if [ $WAIT -lt 0 ]; then
  echo "❌ 18:00はすでに過ぎています"
  read -p "Enterキーで閉じる..."
  exit 1
fi

echo "🕕 18:00にデプロイします（あと ${WAIT} 秒）"
echo "このウィンドウを閉じないでください"

sleep $WAIT

echo ""
echo "🚀 デプロイ開始..."
cd ~/Library/CloudStorage/Dropbox/Yametter_LP

git add -A
git diff --cached --quiet && echo "変更なし" || git commit -m "Deploy $(date '+%Y-%m-%d %H:%M')"
git push

echo ""
echo "✅ デプロイ完了！"
read -p "Enterキーで閉じる..."
