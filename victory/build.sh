#!/bin/bash

current_key=""
result=()

while IFS= read -r line; do
  # 去掉行首空格
  line="${line#"${line%%[![:space:]]*}"}"

  if [[ "$line" =~ ^([a-zA-Z0-9_]+):$ ]]; then
    current_key="${BASH_REMATCH[1]}"
  elif [[ "$line" =~ ^-([[:space:]]*)([a-zA-Z0-9]+)$ ]]; then
    val="${BASH_REMATCH[2]}"
    first_char_upper="$(tr '[:lower:]' '[:upper:]' <<< "${val:0:1}")"
    rest="${val:1}"
    combined="${current_key}${first_char_upper}${rest}"
    result+=("$combined")
  fi
done < build.yml

echo "即将编译的渠道列表:"
for item in "${result[@]}"; do
echo $item
done

read -p "按'回车'继续"

# flutter clean
# flutter pub get
# start=$(date +%s%3N)

# # 测试打印数组内容
# for item in "${result[@]}"; do
#     flutter build apk --flavor $item --target-platform android-arm,android-arm64
# done

# sleep 1

# OUTPUT="all_apks.tar.gz"
# TMPDIR=$(mktemp -d)

# [ -f "$OUTPUT" ] && rm "$OUTPUT"
# # 递归查找当前目录下的 .apk 并复制
# find build/app/outputs/apk/. -type f -name "*.apk" -exec cp {} "$TMPDIR" \;

# tar -czf "$OUTPUT" -C "$TMPDIR" .
# rm -rf "$TMPDIR"

# echo "已打包为 $OUTPUT"




# end=$(date +%s%3N)
# runtime=$((end - start))
# echo "执行时间：${runtime}毫秒"
# # 你也可以在这里继续用 ${result[@]} 数组进行其他操作
