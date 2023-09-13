#import "SPay.h"

@implementation SPay

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupSDK:(RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null]]);
}

RCT_EXPORT_METHOD(isReadyForSPay:(RCTResponseSenderBlock)callback)
{
    callback(@[@YES]);
}

RCT_EXPORT_METHOD(payWithBankInvoiceId: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(getPaymentToken: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], @"abc", [NSNull null], [NSNull null]]);
}

RCT_EXPORT_METHOD(pay: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null], @"success"]);
}

RCT_EXPORT_METHOD(close: (NSString *)state callback: (RCTResponseSenderBlock)callback)
{
    callback(@[[NSNull null]]);
}


@end
