package com.example.app

import android.annotation.SuppressLint
import android.app.Activity
import android.app.ActivityOptions
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


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        initStatusBar()
        setContentView(R.layout.activity_splash)

        Handler(Looper.getMainLooper()).postDelayed({
            activeMain()
        },500)
    }

    private fun initStatusBar() {
        ImmersionBar.with(this)
            .hideBar(BarHide.FLAG_HIDE_STATUS_BAR)  // 隐藏状态栏
            .transparentBar()                        // 状态栏和导航栏都透明
            .navigationBarColor(android.R.color.transparent)  // 导航栏透明（防止被覆盖）
            .fitsSystemWindows(false)                // 内容延伸到状态栏和导航栏区域
            .init();

    }


    private fun activeMain() {
        val mainIntent = Intent(this@SplashActivity, MainActivity::class.java)
        mainIntent.addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION)
        startActivity(mainIntent)
        overridePendingTransition(0, android.R.anim.fade_out);
//        finish();
//        overridePendingTransition(0, 0)
        ImmersionBar.with(this)
            .reset()
            .transparentBar()                // 状态栏和导航栏透明
            .navigationBarColor(android.R.color.transparent)  // 导航栏透明
            .fitsSystemWindows(false)        // 让内容铺满屏幕
            .init();
    }

    override fun onDestroy() {
        super.onDestroy()
    }
}

