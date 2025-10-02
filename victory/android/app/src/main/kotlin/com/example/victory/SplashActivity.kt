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
        },300)
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
        // 这里让取巧采用自定义的动画插值，300毫秒内，最后一帧直接从1到0，实现 splash 盖在 mainActivity上的效果,最后一帧移除splash从而显示mainActivity。
        // 目的是留足时间让flutter端(尤其是flutter读取启动图)读取安卓端的本地图片，避免flutter侧因mainActivity启动时还没有读取到图片导致的白屏
        overridePendingTransition(0, R.anim.fade_out_hold);
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

