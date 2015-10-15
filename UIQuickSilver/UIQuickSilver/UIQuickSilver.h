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

@property (nonatomic, assign) IBInspectable BOOL animate;
@property (nonatomic, assign) IBInspectable CGFloat current;

// Appearance Container
@property (nonatomic, assign) IBInspectable UIColor *containerColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

// Appeacance Silver
@property (nonatomic, assign) IBInspectable UIColor *silverColor;

@end
