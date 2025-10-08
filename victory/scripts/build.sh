#!/bin/bash
set -e

shopt -s nullglob

# 判断文件是否存在
TARGET_FILE="targets.txt"
if [[ ! -f "$TARGET_FILE" ]]; then
  echo "错误：未找到文件 $TARGET_FILE"
  exit 1
fi

echo "即將編譯的渠道列表:"
echo -e "$(cat targets.txt) \n"
read -p "按'回車鍵'繼續"

# 备份文件
BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ANDROID_DIR="$BASE_DIR/android"
ANDROID_APP_DIR="$ANDROID_DIR/app"
ANDROID_MAIN_DIR="$ANDROID_APP_DIR/src/main"

TMP="$BASE_DIR/scripts/.tmp"

# 复制png,webp文件
copy() {
  local base="$1"
  local dest="$2"
  local extensions=("png" "webp")

  for ext in "${extensions[@]}"; do
    local target_file="${dest}.${ext}"
    if [[ -f "$target_file" ]]; then
      rm -f "$target_file"
    fi
  done

  for ext in "${extensions[@]}"; do
    if [[ -f "${base}.${ext}" ]]; then
      cp "${base}.${ext}" "$dest"
      return 0  # 找到一个就复制，退出函数
    fi
  done

  echo "未找到 ${base} 的 png 或 webp 文件，跳过"
  return 1
}

source ./pre_build.sh


flutter clean && flutter pub get

# 逐行读取 targets.txt，并串行执行命令
while IFS= read -r line || [[ -n "$line" ]]; do
  # 忽略空行和注释行（可选）
  [[ -z "$line" || "$line" == \#* ]] && continue
    # 设置参数（可以设置多个）
    set -- $line
    source ./build_flutter.sh
done < "$TARGET_FILE"

source ./post_build.sh

read -p "🎉 All builds finished. Press Enter to exit..."