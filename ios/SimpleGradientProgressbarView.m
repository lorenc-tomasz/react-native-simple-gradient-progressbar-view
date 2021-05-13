//
//  SimpleGradientProgressbarView.m
//  SimpleGradientProgressbarView
//
//  Created by Tomasz Lorenc on 13/05/2021.
//  Copyright © 2021 Facebook. All rights reserved.
//

#import "SimpleGradientProgressbarView.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SimpleGradientProgressbarView()

@property CAGradientLayer *gradientLayer;
@property UIColor *_fromColor;
@property UIColor *_toColor;
@property NSNumber *_progress;
@property NSNumber *_cornerRadius;
@property (nonatomic) NSArray<NSNumber *> *_maskedCorners;

@end

@implementation SimpleGradientProgressbarView

// Mark: - Init
- (instancetype)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.gradientLayer = [self makeGradientLayer];
    [self.layer addSublayer:self.gradientLayer];
  
    self._fromColor = [UIColor blackColor];
    self._toColor = [UIColor whiteColor];
    self._progress = @0.0;
    self._cornerRadius = @0.0;
    self._maskedCorners = @[@1, @1, @1, @1];
    
    if (@available(iOS 11.0, *)) {
      self.gradientLayer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
    }
    [self update];
  }
  return self;
}

// Mark - Life cycle

-(void)layoutSubviews {
  [super layoutSubviews];
  self.gradientLayer.frame = CGRectMake(
    0,
    0,
    self.bounds.size.width * self._progress.floatValue,
    self.bounds.size.height
  );
}

// MARK: - Properties

- (void)setFromColor:(UIColor *)color {
  self._fromColor = color;
  [self update];
}

- (void)setToColor:(UIColor *)color {
  self._toColor = color;
  [self update];
}

- (void)setProgress:(NSNumber *)progress {
  self._progress = progress;
  [self update];
}

- (void)setCornerRadius:(NSNumber *)cornerRadius {
  self._cornerRadius = cornerRadius;
  [self update];
}

- (void)setMaskedCorners:(NSArray<NSNumber *> *)maskedCorners {
  self._maskedCorners = maskedCorners;
  
  if (@available(iOS 11.0, *)) {
    if (self._maskedCorners.count > 0) {
      BOOL added = NO;
      for (int i = 0; i < self._maskedCorners.count; i++) {
        NSNumber *n = self._maskedCorners[i];
        int number = [n intValue];
        // Left Top Corner
        if (i == 0) {
          if (number > 0) {
            if (added) {
              self.gradientLayer.maskedCorners = self.gradientLayer.maskedCorners | kCALayerMinXMinYCorner;
            } else {
              self.gradientLayer.maskedCorners = kCALayerMinXMinYCorner;
              added = YES;
            }
          }
        }
        // Right Top corner
        if (i == 1) {
          if (number > 0) {
            if (added) {
              self.gradientLayer.maskedCorners = self.gradientLayer.maskedCorners | kCALayerMaxXMinYCorner;
            } else {
              self.gradientLayer.maskedCorners = kCALayerMaxXMinYCorner;
              added = YES;
            }
          }
        }
        // Left Bottom corner
        if (i == 2) {
          if (number > 0) {
            if (added) {
              self.gradientLayer.maskedCorners = self.gradientLayer.maskedCorners | kCALayerMinXMaxYCorner;
            } else {
              self.gradientLayer.maskedCorners = kCALayerMinXMaxYCorner;
              added = YES;
            }
          }
        }
        // Right Bottom corner
        if (i == 3) {
          if (number > 0) {
            if (added) {
              self.gradientLayer.maskedCorners = self.gradientLayer.maskedCorners | kCALayerMaxXMaxYCorner;
            } else {
              self.gradientLayer.maskedCorners = kCALayerMaxXMaxYCorner;
              added = YES;
            }
          }
        }
      }
    }
  }
  
  [self update];
}

// MARK: - Helper

- (void)update {
  self.gradientLayer.colors = @[
                                (id)self._fromColor.CGColor,
                                (id)self._toColor.CGColor
                                ];
  self.gradientLayer.cornerRadius = self._cornerRadius.floatValue;
  
  [self setNeedsLayout];
}

- (CAGradientLayer *)makeGradientLayer {
  CAGradientLayer *gradientLayer = [CAGradientLayer layer];
  gradientLayer.masksToBounds = true;
  gradientLayer.startPoint = CGPointMake(0.0, 0.5);
  gradientLayer.endPoint = CGPointMake(1.0, 0.5);
  gradientLayer.anchorPoint = CGPointZero;
  
    return gradientLayer;
}

@end
