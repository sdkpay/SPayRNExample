#import "SPayButtonManager.h"


@implementation RNTSPayButtonManager

RCT_EXPORT_MODULE(RNTSPayButton)

- (UIView *)view
{
  UIView* view = [[UIView alloc] init];
  view.backgroundColor = UIColor.greenColor;
  return view;
}

@end