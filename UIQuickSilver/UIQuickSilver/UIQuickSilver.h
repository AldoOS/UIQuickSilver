//
//  UIQuickSilver.h
//  UIQuickSilver
//
//  Created by harald bregu on 14/10/15.
//  Copyright © 2015 Harald. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIQuickSilver : UIView

@property (nonatomic, assign) IBInspectable CGFloat current;
@property (nonatomic, assign) IBInspectable UIColor *colorBackground;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, assign) IBInspectable UIColor *silverColor;

@end
