package com.example.app

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

interface IMethodCallHandler {
    fun handle(call: MethodCall, result: MethodChannel.Result): Boolean
}
