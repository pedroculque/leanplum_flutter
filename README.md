# leanplum_flutter

A flutter plugin for the Leanplum SDK

## Getting Started

The Leanplum Flutter plugin allows you to access to the GDPR methods from the Dart code.

Nevertheless, the configuration of the SDK must still be done at the android and iOS app level.

A [Flutter application](https://github.com/pculque/leanplum_flutter) is available on github to show you a concrete implementation.

You just have to clone the plugin repository [https://github.com/pculque/leanplum_flutter](https://github.com/pculque/leanplum_flutter), and open it with an android studio configured for flutter.

## Add the plugin to your project

* Open the **pubspec.yaml**
* add to the dependencies section

```yaml
leanplum_flutter:0.0.2
```

## Initialize the SDK

Follow the [iOS](https://docs.leanplum.com/reference#ios-setup) and [Android](https://docs.leanplum.com/reference#android-setup) 10-15 minutes quickstart to initialize the SDK
at the native app level.

### Android

Before following the previous tutorial. You need to open the application build.gradle and change two things :
- You need to add the 'Firebase Messaging dependency to your application', to be able to initialize the SDK.
- You need to add the Leanplum dependency to your application, to be able to initialize the SDK.

```
// Firebase messaging.
  // Minimum supported version of Firebase is 10.0.1.
  implementation 'com.leanplum:leanplum-fcm:5.3.3'
  implementation 'com.google.firebase:firebase-messaging:17.5.0'

  // Location services.
  // Only include if you need location-based messaging.
  // Minimum supported version of play location is:
  // 10.0.1 for FCM.

```

>**Warning:**
>
> On Android, when you extend the default application you must use the **FlutterApplication** and not the default Application
>
> ```java
> public class FlutterApp extends FlutterApplication
> ```

### iOS

- To 'enable Push Notifications' on iOS, you need to upload your certificates to Leanplum and register for remote notifications in your app.

[https://docs.leanplum.com/reference#ios-push-notifications](https://docs.leanplum.com/reference#ios-push-notifications)

First thing to do is to update the Podfile sources, you can add at the beginning of the file the following URLs:

- source 'https://github.com/CocoaPods/Specs.git'

Then, you also need to set the minimum platform support to 8.0:

```
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
```

Leanplum SDK flutter plugin uses a beta version of the SDK, please ensure that in your final Podfile

```
pod 'Leanplum-iOS-SDK', '2.6.4'
```

You're ready to follow the iOS tutorial.

### Android push notifications

###### To use FCM with Leanplum, you need to:

1. Verify that your Gradle files include the correct FCM and Leanplum libraries (see above).
2. Download your google-services.json config file (see how here).
3. Add the above file to your root app/ folder.
4. Copy your FCM Server Key. In the Firebase console, click the gear icon next to Overview, then click Project Settings.Then, in your project's settings, go to the Cloud Messaging tab. In this section of your settings, you will see your Server key.
5. Copy the key.

