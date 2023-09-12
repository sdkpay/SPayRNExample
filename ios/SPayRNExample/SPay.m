#import "SPay.h"

@implementation SPay

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupSDK:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], [NSNull null]]);
}

RCT_EXPORT_METHOD(isReadyForSPay:(RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"isReady" : @YES
    };

    callback(@[[NSNull null], resultsDict]);
}

RCT_EXPORT_METHOD(payWithBankInvoiceId: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"success" : @YES,
       @"waiting" : @NO
    };

    callback(@[[NSNull null], resultsDict]);
}

RCT_EXPORT_METHOD(getPaymentToken: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"paymentToken" : @"abc"
    };

    callback(@[[NSNull null], resultsDict]);
}

RCT_EXPORT_METHOD(pay: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"success" : @YES,
       @"waiting" : @NO
    };

    callback(@[[NSNull null], resultsDict]);
}

RCT_EXPORT_METHOD(close: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  NSDictionary *resultsDict = @{
       @"success" : @YES,
       @"waiting" : @NO
    };

    callback(@[[NSNull null], [NSNull null]]);
}


@end
