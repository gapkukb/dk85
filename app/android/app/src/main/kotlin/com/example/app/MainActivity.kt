package com.example.app
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "my.channel").setMethodCallHandler {
            call, result ->
            if (call.method == "moveTaskToBack") {
                moveTaskToBack(true) // true to include the root activity
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }
}