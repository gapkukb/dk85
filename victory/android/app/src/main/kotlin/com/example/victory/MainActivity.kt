package com.example.app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    private lateinit var nativeImageProvider: NativeImageProvider
    private val handlers = mutableListOf<IMethodCallHandler>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        val name = "victory_native_channel"

        nativeImageProvider = NativeImageProvider(this);
        handlers.add(nativeImageProvider)
        // 可以继续添加其他Handler，如 handlers.add(OtherHandler(this))

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, name)
            .setMethodCallHandler { call, result ->
                for (handler in handlers) {
                    if (handler.handle(call, result)) {
                        return@setMethodCallHandler
                    }
                }
                // 无handler处理
                result.notImplemented()
            }
    }
}

