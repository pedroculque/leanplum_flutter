import Flutter
import UIKit
#if DEBUG
import AdSupport
#endif
import Leanplum

public class SwiftLeanplumFlutterPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "leanplum_flutter", binaryMessenger: registrar.messenger())
        let instance = SwiftLeanplumFlutterPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        NSLog( "herowPlugin - method: \(call.method)")
        switch (call.method) {
        case "start":
            if (proceedArguments(call: call, result: result, keys: [ "userId"])) {
                if let arguments = call.arguments, let arg = arguments as? [String: Any] {
                    if let value: String = arg["userId"] as? String {
                        Leanplum.start(withUserId: value)
                    }
                }
            }else{
                Leanplum.start()
            }
            break;
            
        case "setUserId":
            if (proceedArguments(call: call, result: result, keys: [ "userId"])) {
                if let arguments = call.arguments, let arg = arguments as? [String: Any] {
                    if let value: String = arg["userId"] as? String {
                        Leanplum.setUserId(value)
                    }
                }
            }
            break
        case "setAppVersion":
            if (proceedArguments(call: call, result: result, keys: [ "appVersion"])) {
                if let arguments = call.arguments, let arg = arguments as? [String: Any] {
                    if let value: String = arg["appVersion"] as? String {
                        Leanplum.setAppVersion(value)
                    }
                }
            }
            break
            
        case "setDeviceId":
            if (proceedArguments(call: call, result: result, keys: [ "deviceId"])) {
                if let arguments = call.arguments, let arg = arguments as? [String: Any] {
                    if let value: String = arg["deviceId"] as? String {
                        Leanplum.setDeviceId(value)
                        
                    }
                }
            }
            break
        default:
            result(FlutterMethodNotImplemented);
        }
    }
    
    func proceedArguments(call: FlutterMethodCall, result: @escaping FlutterResult, keys: [String]) -> Bool {
        if let arguments = call.arguments,
            let arg = arguments as? [String: Any] {
            for key in keys {
                if arg[key] == nil {
                    result(FlutterError(code: "ARGUMENT_ERRROR", message: "Key \(key) is empty", details: nil))
                    return false
                }
            }
        } else if (call.arguments == nil) {
            result(FlutterError(code: "ARGUMENT_ERRROR", message: "Arguements is empty", details: nil))
            return false
        }
        return true
    }
}
