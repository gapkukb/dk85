run_build() {
  FLAVOR=$1

  flutter build apk --build-name=$FLAVOR 2>&1 \
    | while IFS= read -r line; do
        echo "[$FLAVOR] $line"
      done
}



# 启动 3 个任务并行执行
run_build jjj2_d001&
PID1=$!

run_build jjj2_d002 &
PID2=$!

# 等待所有任务完成
wait $PID1
wait $PID2

echo "✅ All builds completed."

read -p "🎉 All builds finished. Press Enter to exit..."