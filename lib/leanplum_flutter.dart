import 'package:flutter/services.dart';

class LeanplumFlutter {
  LeanplumFlutter._internal();
  factory LeanplumFlutter() => _singleton;

  static const MethodChannel _channel = const MethodChannel('leanplum_flutter');

  static final LeanplumFlutter _singleton = LeanplumFlutter._internal();

  // Start the Leanplum SDK.
  static start({String userId = ''}) {
    _channel.invokeMethod('start', <String, dynamic>{
      'userId': userId,
    });
  }

  static setUserId(String userId) {
    _channel.invokeMethod('setUserId', <String, dynamic>{
      'userId': userId,
    });
  }

  static setAppVersion(String appVersion) {
    _channel.invokeMethod('setAppVersion', <String, dynamic>{
      'appVersion': appVersion,
    });
  }

  static setDeviceId(String deviceId) {
    _channel.invokeMethod('setDeviceId', <String, dynamic>{
      'deviceId': deviceId,
    });
  }
}
