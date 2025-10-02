package com.example.victory

import android.app.Application

class App : Application() {

    override fun onCreate() {
        super.onCreate()
        Thread.sleep(3*1000)
    }
}