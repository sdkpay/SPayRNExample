#import "SPay.h"

@implementation SPay

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupSDK:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], @("Result")]);
}

RCT_EXPORT_METHOD(isReadyForSPay:(RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"isReady" : @YES
    };

    callback(@[[NSNull null], resultsDict]);
}

@end
