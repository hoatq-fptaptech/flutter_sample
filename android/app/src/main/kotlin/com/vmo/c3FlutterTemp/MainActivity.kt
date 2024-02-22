package com.vmo.c3FlutterTemp

import androidx.annotation.NonNull
import com.vmo.c3FlutterTemp.BuildConfig.FLAVOR
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "flavor"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getFlavor") {
                println("Flavor : $FLAVOR")
                result.success(FLAVOR)
            }
        }
    }
}
