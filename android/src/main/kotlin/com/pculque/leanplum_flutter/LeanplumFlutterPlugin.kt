package com.pculque.leanplum_flutter

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import android.util.Log
import com.leanplum.Leanplum


/** LeanplumFlutterPlugin */
class LeanplumFlutterPlugin : FlutterPlugin, MethodCallHandler {

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "leanplum_flutter")
        channel.setMethodCallHandler(LeanplumFlutterPlugin())
    }

    // This static function is optional and equivalent to onAttachedToEngine. It supports the old
    // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
    // plugin registration via this function while apps migrate to use the new Android APIs
    // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
    //
    // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
    // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
    // depending on the user's project. onAttachedToEngine or registerWith must both be defined
    // in the same class.

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            Leanplum.setApplicationContext(registrar.activeContext())
            val channel = MethodChannel(registrar.messenger(), "leanplum_flutter")
            channel.setMethodCallHandler(LeanplumFlutterPlugin())
        }
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        Log.d("LeanplumFlutterPlugin", "method: " + call.method)

        if (call.method == "setUserId") {
            if (proceedArguments(call, result, "userId")) {
                Leanplum.setUserId(call.argument<String>("userId"))
            }
        } else if (call.method == "setDeviceId") {
            if (proceedArguments(call, result, "deviceId")) {
                Leanplum.setDeviceId(call.argument<String>("deviceId"))
            }
        } else if (call.method == "setAppVersion") {
            result.success("ANDROID SDK NOT IMPLEMENTED")
        } else if (call.method == "start") {
            if (proceedArguments(call, result, "userId")) {
                Leanplum.start(Leanplum.getContext(), call.argument<String>("userId"))
            } else {
                Leanplum.start(Leanplum.getContext())
            }
        } else {
            result.notImplemented()
        }

    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    }

    private fun proceedArguments(call: MethodCall, result: Result, vararg keys: String): Boolean {
        if (call.arguments == null) {
            result.error("ARGUMENT_ERROR", "Arguments is empty", null)
            return false
        }
        for (key in keys) {
            if (!call.hasArgument(key)) {
                result.error("ARGUMENT_ERROR", "Key $key is empty", null)
                return false
            }
        }
        return true
    }
}
