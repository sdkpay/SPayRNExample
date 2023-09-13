#import "SPayButtonManager.h"
#import <MapKit/MapKit.h>
#import <React/RCTViewManager.h>

@interface RNTMapManager : RCTViewManager
@end

// @implementation RNTSPayButtonManager

// RCT_EXPORT_MODULE(RNTSPayButton)

// - (UIView *)view
// {
//   // UIView* view = [[UIView alloc] init];
//   // return view;
//   return [[MKMapView alloc] init];

// }

// @end

@implementation RNTMapManager

RCT_EXPORT_MODULE(RNTMap)

- (UIView *)view
{
  UIView* view = [[UIView alloc] init];
  view.backgroundColor = UIColor.greenColor;
  return view;
}

@end
