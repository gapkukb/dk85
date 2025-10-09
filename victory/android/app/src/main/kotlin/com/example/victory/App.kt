package com.example.app

import android.app.Application

class App : Application() {

    override fun onCreate() {
        super.onCreate()
        Thread.sleep(3*1000)
    }
}