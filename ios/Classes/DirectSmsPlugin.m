#import "DirectSmsPlugin.h"
#if __has_include(<direct_sms/direct_sms-Swift.h>)
#import <direct_sms/direct_sms-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "direct_sms-Swift.h"
#endif

@implementation DirectSmsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDirectSmsPlugin registerWithRegistrar:registrar];
}
@end
