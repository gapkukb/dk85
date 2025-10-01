package com.example.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.victory.IMethodCallHandler

class MainActivity : FlutterActivity() {
    private lateinit var nativeImageProvider: NativeImageProvider
    private val handlers = mutableListOf<IMethodCallHandler>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        val name = "victory_native_channel"
        super.configureFlutterEngine(flutterEngine)
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

