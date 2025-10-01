package com.example.app

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.example.victory.IMethodCallHandler
import androidx.lifecycle.lifecycleScope
import com.gyf.immersionbar.ImmersionBar
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    private lateinit var nativeImageProvider: NativeImageProvider
    private val handlers = mutableListOf<IMethodCallHandler>()

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
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

