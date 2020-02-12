#import "LeanplumFlutterPlugin.h"
#if __has_include(<leanplum_flutter/leanplum_flutter-Swift.h>)
#import <leanplum_flutter/leanplum_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "leanplum_flutter-Swift.h"
#endif

@implementation LeanplumFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLeanplumFlutterPlugin registerWithRegistrar:registrar];
}
@end
