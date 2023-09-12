#import "SPay.h"

@implementation SPay

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupSDK:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], @("Result")]);
}

@end
