#import "SPayBridgeModule.h"
#import "AppDelegate.h"

@implementation SPayBridgeModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(setupSDK:(RCTResponseSenderBlock)callback)
{
  [SPay setupWithApiKey:@""
               bnplPlan:true
            environment: SEnvironmentSandboxWithoutBankApp
             completion:^{
    callback(@[[NSNull null]]);
  }];
}

RCT_EXPORT_METHOD(isReadyForSPay:(RCTResponseSenderBlock)callback)
{
  bool isReady = [SPay isReadyForSPay];
  callback(@[@(isReady)]);
}

RCT_EXPORT_METHOD(payWithBankInvoiceId: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  
  dispatch_async(dispatch_get_main_queue(), ^{
    SBankInvoiceIdPaymentRequest * request = [[SBankInvoiceIdPaymentRequest alloc]
                                              initWithMerchantLogin:params[@"merchantLogin"]
                                              bankInvoiceId:params[@"bankInvoiceId"]
                                              language:params[@"language"]
                                              redirectUri:params[@"redirectUri"]
                                              apiKey:params[@"apiKey"]];
    [SPay payWithBankInvoiceIdWith:self.topViewController
                    paymentRequest:request
                        completion:^(enum SPayState state, NSString * _Nonnull info) {
      switch(state) {
        case SPayStateSuccess:
          callback(@[[NSNull null], @"success"]);
          break;
        case SPayStateWaiting:
          callback(@[[NSNull null], @"waiting"]);
          break;
        case SPayStateError:
          callback(@[info, info]);
          break;
      }
    }];
  });
}

RCT_EXPORT_METHOD(getPaymentToken: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    SPaymentTokenRequest *requestModel = [[SPaymentTokenRequest alloc] initWithRedirectUri:params[@"redirectUri"]
                                                                             merchantLogin:params[@"merchantLogin"]
                                                                                    amount:params[@"amount"]
                                                                                  currency:params[@"currency"]
                                                                               mobilePhone:params[@"mobilePhone"]
                                                                               orderNumber:params[@"orderNumber"]
                                                                          recurrentExipiry:params[@"recurrentExipiry"]
                                                                        recurrentFrequency:params[@"recurrentFrequency"]
                                                                                    apiKey:params[@"apiKey"]];
    
    [SPay getPaymentTokenWith:self.topViewController
                         with:requestModel
                   completion:^(SPaymentTokenResponse * _Nonnull response) {
      callback(@[response.error.errorDescription,
                 response.paymentToken,
                 response.paymentTokenId,
                 [NSNull null]]);
    }];
  });
}

RCT_EXPORT_METHOD(pay: (NSDictionary *)params callback: (RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_main_queue(), ^{
    SPaymentRequest *request = [[SPaymentRequest alloc] initWithOrderId: params[@"bankInvoiceId"]
                                                           paymentToken: params[@"paymentToken"]];
    [SPay payWith:request completion:^(enum SPayState state, NSString * _Nonnull info) {
      switch(state) {
        case SPayStateSuccess:
          callback(@[[NSNull null], @"success"]);
          break;
        case SPayStateWaiting:
          callback(@[[NSNull null], @"waiting"]);
          break;
        case SPayStateError:
          callback(@[info, info]);
          break;
      }
    }];
  });
}

RCT_EXPORT_METHOD(close: (NSString *)state callback: (RCTResponseSenderBlock)callback)
{
  if ([state isEqual: @"success"]) {
    [SPay completePaymentWithPaymentState: SPayStateSuccess completion:^{
      callback(@[[NSNull null]]);
    }];
  } else if ([state isEqual: @"waiting"]) {
    [SPay completePaymentWithPaymentState: SPayStateWaiting completion:^{
      callback(@[[NSNull null]]);
    }];
  } else if ([state isEqual: @"error"]) {
    [SPay completePaymentWithPaymentState: SPayStateError completion:^{
      callback(@[[NSNull null]]);
    }];
  }
}

- (UIViewController*)topViewController {
  return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)viewController {
  if ([viewController isKindOfClass:[UITabBarController class]]) {
    UITabBarController* tabBarController = (UITabBarController*)viewController;
    return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
  } else if ([viewController isKindOfClass:[UINavigationController class]]) {
    UINavigationController* navContObj = (UINavigationController*)viewController;
    return [self topViewControllerWithRootViewController:navContObj.visibleViewController];
  } else if (viewController.presentedViewController && !viewController.presentedViewController.isBeingDismissed) {
    UIViewController* presentedViewController = viewController.presentedViewController;
    return [self topViewControllerWithRootViewController:presentedViewController];
  }
  else {
    for (UIView *view in [viewController.view subviews])
    {
      id subViewController = [view nextResponder];
      if ( subViewController && [subViewController isKindOfClass:[UIViewController class]])
      {
        if ([(UIViewController *)subViewController presentedViewController]  && ![subViewController presentedViewController].isBeingDismissed) {
          return [self topViewControllerWithRootViewController:[(UIViewController *)subViewController presentedViewController]];
        }
      }
    }
    return viewController;
  }
}


@end
