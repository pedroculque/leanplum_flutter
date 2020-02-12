package com.pculque.leanplum_flutter_example

import com.leanplum.Leanplum
import com.leanplum.annotations.Parser
import io.flutter.app.FlutterApplication
import com.leanplum.LeanplumActivityHelper

class CustomApp : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()

        Leanplum.setApplicationContext(this)
        Parser.parseVariables(this)
        //  For session lifecyle tracking.
        LeanplumActivityHelper.enableLifecycleCallbacks(this)

        // Insert your API keys here.
        if (BuildConfig.DEBUG) {
            Leanplum.setAppIdForDevelopmentMode("Your App ID", "Your Development Key")
        } else {
            Leanplum.setAppIdForProductionMode("Your App ID", "Your Production Key")
        }

        // This will only run once per session, even if the activity is restarted.
        Leanplum.start(this)

    }
}