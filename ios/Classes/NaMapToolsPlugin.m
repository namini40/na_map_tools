#import "NaMapToolsPlugin.h"
#if __has_include(<na_map_tools/na_map_tools-Swift.h>)
#import <na_map_tools/na_map_tools-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "na_map_tools-Swift.h"
#endif

@implementation NaMapToolsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNaMapToolsPlugin registerWithRegistrar:registrar];
}
@end
