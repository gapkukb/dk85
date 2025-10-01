package com.example.app

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import kotlinx.coroutines.*
import android.util.Log
import android.widget.Toast
import com.gyf.immersionbar.BarHide
import com.gyf.immersionbar.ImmersionBar

@SuppressLint("CustomSplashScreen")
class SplashActivity : Activity() {
    // 创建一个 CoroutineScope，这样就能在 Activity 内部启动协程了
    private var job: Job? = null
    private val coroutineScope = CoroutineScope(Dispatchers.Main)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initStatusBar()
        setContentView(R.layout.activity_splash)

        startActivity(Intent(this, MainActivity::class.java))
        overridePendingTransition(0,0)
        // 延迟1秒后关闭自己，让MainActivity显示
        Handler(Looper.getMainLooper()).postDelayed({
            finish()
            overridePendingTransition(0,0)
            ImmersionBar.with(this)
                .reset()
                .transparentBar()                // 状态栏和导航栏透明
                .navigationBarColor(android.R.color.transparent)  // 导航栏透明
                .fitsSystemWindows(false)        // 让内容铺满屏幕
                .init();
        }, 500)


//        delayActiveMain()
//        activeMain()
    }
    private fun initStatusBar() {
        ImmersionBar.with(this)
            .hideBar(BarHide.FLAG_HIDE_STATUS_BAR)  // 隐藏状态栏
            .transparentBar()                        // 状态栏和导航栏都透明
            .navigationBarColor(android.R.color.transparent)  // 导航栏透明（防止被覆盖）
            .fitsSystemWindows(false)                // 内容延伸到状态栏和导航栏区域
            .init();

    }
    private fun delayActiveMain() {
        // 启动一个协程
        job = coroutineScope.launch {
            // 模拟一个耗时的操作
            delay(1000)  // 假设这是一个耗时操作
            // 协程执行完后更新 UI
            Log.d("MainActivity", "Operation completed!")
            activeMain()
        }
    }

    private fun activeMain() {
        val mainIntent = Intent(this@SplashActivity, MainActivity::class.java)
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
        startActivity(mainIntent)
        finish();
        overridePendingTransition(0, 0)
        ImmersionBar.with(this)
            .reset()
            .transparentBar()                // 状态栏和导航栏透明
            .navigationBarColor(android.R.color.transparent)  // 导航栏透明
            .fitsSystemWindows(false)        // 让内容铺满屏幕
            .init();
    }

    override fun onDestroy() {
        super.onDestroy()
        // 在 Activity 销毁时手动取消协程，防止内存泄漏
        job?.cancel()
    }
}

