#!/bin/bash
set -e

CHANNEL=$1

echo "--------------------✅$CHANNEL--------------------"

CHANNEL_DIR="$BASE_DIR/channels/$CHANNEL"
CONFIG_FILE="$CHANNEL_DIR/app.txt"

# 校验资源是否存在
if [ ! -d "$CHANNEL_DIR" ]; then
  echo "❌ 未找到资源目录: $CHANNEL_DIR"
  exit 1
fi

APP_ID=$(sed -n '1p' "$CONFIG_FILE" | xargs)
APP_NAME=$(sed -n '2p' "$CONFIG_FILE" | xargs)

echo "✅[$CHANNEL] App ID: $APP_ID"
echo "✅[$CHANNEL] App Name: $APP_NAME"

# 替换图标和splash
copy "$CHANNEL_DIR/launch_icon" "$ANDROID_MAIN_DIR/res/drawable/"
copy "$CHANNEL_DIR/launch_image" "$ANDROID_MAIN_DIR/res/drawable/"


# 替换 build.gradle.kts 的 applicationId
sed -i "s#applicationId *= *\"[^\"]*\"#applicationId = \"$APP_ID\"#" "$ANDROID_APP_DIR/build.gradle.kts"

# 替换 app_name
sed -i "s|<string name=\"app_name\">.*</string>|<string name=\"app_name\">$APP_NAME</string>|" "$ANDROID_MAIN_DIR/res/values/strings.xml"

# echo "✅[$CHANNEL] 已替换：图标、Splash、applicationId = $APP_ID、appName = $APP_NAME"

echo "✅[$CHANNEL] 开始flutter构建"

flutter build apk --target-platform android-arm,android-arm64 --obfuscate --split-debug-info=./debug-info --dart-define=ENV=production

# 查找构建完成后的.apk并移动到指定目录并改名
find "$BASE_DIR/build/app/outputs/apk/release" -type f -iname "*.apk" | while read -r apk_file; do
    current_datetime=$(date +"%Y%m%d_%H%M")

    # 移动并重命名文件
    cp "$apk_file" "$TMP/$APP_ID-$current_datetime.apk"
done

