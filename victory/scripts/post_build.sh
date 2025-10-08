#!/bin/bash
set -e

echo "✅  构建完成，恢复現場..."

rm -rf $ANDROID_APP_DIR

mv "$TMP/app" $ANDROID_DIR 

echo "✅ 开始压缩...."

cd $TMP && tar --remove-files -caf $TMP/apks.tar.xz *.apk

mv apks.tar.xz $BASE_DIR

sleep 1  # 暂停1秒

rm -rf $TMP

echo "✅ 压缩结束...."
