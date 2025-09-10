package com.example.app

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Intent
import android.os.Build
import android.os.Bundle
import kotlinx.coroutines.*
import android.util.Log
import com.gyf.immersionbar.ImmersionBar

@SuppressLint("CustomSplashScreen")
class SplashActivity : Activity() {
    // 创建一个 CoroutineScope，这样就能在 Activity 内部启动协程了
    private var job: Job? = null
    private val coroutineScope = CoroutineScope(Dispatchers.Main)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            // Android 11 (API 30)及以上版本
            // 你的代码逻辑
        } else {
            // 对于较低的版本
            // 你的代码逻辑
        }
        initStatusBar()
        setContentView(R.layout.activity_splash)



        delayActiveMain()
//        activeMain()
    }
    private fun initStatusBar() {
        ImmersionBar.with(this)
            .statusBarColor(R.color.transparent)
            .statusBarDarkFont(false)
            .fitsSystemWindows(false)
            .navigationBarColor(R.color.transparent)
            .navigationBarDarkIcon(false)
            .init()
    }
    private fun delayActiveMain() {
        // 启动一个协程
        job = coroutineScope.launch {
            // 模拟一个耗时的操作
            delay(1000)  // 假设这是一个耗时操作
            // 协程执行完后更新 UI
            Log.d("MainActivity", "Operation completed!")
            activeMain()
            finish()
        }
    }

    private fun activeMain() {
        val mainIntent = Intent(this@SplashActivity, MainActivity::class.java)
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
        startActivity(mainIntent)
        ImmersionBar.with(this).reset().init();
    }

    override fun onDestroy() {
        super.onDestroy()
        // 在 Activity 销毁时手动取消协程，防止内存泄漏
        job?.cancel()
    }
}