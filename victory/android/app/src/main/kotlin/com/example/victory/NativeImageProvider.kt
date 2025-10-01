package com.example.app

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Bitmap
import android.graphics.drawable.BitmapDrawable
import android.graphics.drawable.Drawable
import androidx.core.content.ContextCompat
import com.example.victory.IMethodCallHandler
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.IOException

// 将原生图片保存到手机存储，供flutter显示
class NativeImageProvider(private val context: Context) : IMethodCallHandler {

    override fun handle(call: MethodCall, result: MethodChannel.Result): Boolean {
        if (call.method != "native_image") return false

        val fileNameWithSuffix = call.argument<String>("name")
        if (fileNameWithSuffix.isNullOrEmpty()) {
            result.error("INVALID_ARGUMENT", "No file name provided", null)
            return true
        }

        val path = saveDrawableWithSuffix(fileNameWithSuffix)
        if (path != null) {
            result.success(path)
        } else {
            result.error("SAVE_FAILED", "Failed to save image", null)
        }
        return true
    }

    @SuppressLint("DiscouragedApi")
    private fun saveDrawableWithSuffix(fileNameWithSuffix: String): String? {
        val name = fileNameWithSuffix.substringBefore('.')
        val suffix = fileNameWithSuffix.substringAfter('.', "")

        if (suffix.isEmpty()) return null

        val dir = context.cacheDir
        if (!dir.exists()) dir.mkdirs()

        val file = File(dir, fileNameWithSuffix)
        if (file.exists()) return file.absolutePath

        val resId = context.resources.getIdentifier(name, "drawable", context.packageName)
        if (resId == 0) return null

        val drawable: Drawable = ContextCompat.getDrawable(context, resId) ?: return null
        if (drawable !is BitmapDrawable) return null
        val bitmap: Bitmap = drawable.bitmap

        return try {
            val fos = FileOutputStream(file)
            val format = when (suffix.lowercase()) {
                "jpg", "jpeg" -> Bitmap.CompressFormat.JPEG
                "png" -> Bitmap.CompressFormat.PNG
                "webp" -> {
                    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
                        Bitmap.CompressFormat.WEBP_LOSSY
                    } else {
                        @Suppress("DEPRECATION")
                        Bitmap.CompressFormat.WEBP
                    }
                }
                else -> Bitmap.CompressFormat.PNG
            }
            bitmap.compress(format, 100, fos)
            fos.flush()
            fos.close()
            file.absolutePath
        } catch (e: IOException) {
            e.printStackTrace()
            null
        }
    }
}
