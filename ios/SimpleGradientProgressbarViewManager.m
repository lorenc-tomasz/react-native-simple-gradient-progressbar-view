#import <React/RCTViewManager.h>
#import "SimpleGradientProgressbarView.h"

@interface SimpleGradientProgressbarViewManager : RCTViewManager
@end

@implementation SimpleGradientProgressbarViewManager

RCT_EXPORT_MODULE(SimpleGradientProgressbarView)

- (UIView *)view
{
  return [[SimpleGradientProgressbarView alloc] init];
}


RCT_EXPORT_VIEW_PROPERTY(progress, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(cornerRadius, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(fromColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(toColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(maskedCorners, NSNumberArray)

@end
