import UIKit
import Flutter
#if DEBUG
    import AdSupport
#endif
import Leanplum

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Get your App ID and Keys from https://www.leanplum.com/dashboard?#/account/apps
  #if DEBUG
    Leanplum.setDeviceId(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
    Leanplum.setAppId("YOUR_APP_ID",
      withDevelopmentKey:"YOUR_DEVELOPMENT_KEY")
  #else
    Leanplum.setAppId("YOUR_APP_ID",
      withProductionKey: "YOUR_PRODUCTION_KEY")
  #endif

  // Optional: Tracks in-app purchases automatically as the "Purchase" event.
  // To require valid receipts upon purchase or change your reported
  // currency code from USD, update your app settings.
  // Leanplum.trackInAppPurchases()

  // Optional: Tracks all screens in your app as states in Leanplum.
  // Leanplum.trackAllAppScreens()
  
  // Sets the app version, which otherwise defaults to
  // the build number (CFBundleVersion).
  Leanplum.setAppVersion("YOUR_APP_VERSION")

  // Starts a new session and updates the app content from Leanplum.
  Leanplum.start()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
