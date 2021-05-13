#import <React/RCTViewManager.h>
#import "SimpleGradientProgressbarView.h"

@interface SimpleGradientProgressbarViewViewManager : RCTViewManager
@end

@implementation SimpleGradientProgressbarViewViewManager

RCT_EXPORT_MODULE(SimpleGradientProgressbarViewView)

- (UIView *)view
{
  return [[UIView alloc] init];
}


RCT_EXPORT_VIEW_PROPERTY(progress, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(cornerRadius, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(fromColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(toColor, UIColor);
RCT_EXPORT_VIEW_PROPERTY(maskedCorners, NSNumberArray)

@end
