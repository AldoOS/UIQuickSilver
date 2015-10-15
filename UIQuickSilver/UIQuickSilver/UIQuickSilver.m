//
//  UIQuickSilver.m
//  UIQuickSilver
//
//  Created by harald bregu on 14/10/15.
//  Copyright © 2015 Harald. All rights reserved.
//

#import "UIQuickSilver.h"

@interface UIQuickSilver () {
    
    UIView *silverView;
    NSLayoutConstraint *rightConstraint;
}
@end

@implementation UIQuickSilver

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.backgroundColor = [UIColor whiteColor];
    
    // Layer Defaults
    self.layer.masksToBounds = YES;
    self.layer.backgroundColor = [UIColor whiteColor].CGColor;
    self.layer.cornerRadius = 3.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    
    // Silver
    silverView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:silverView];
    silverView.backgroundColor = [UIColor grayColor];

    _animate = NO;
    _current = 0.0f;
}

- (void)updateConstraints {
    
    silverView.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailingMargin relatedBy:NSLayoutRelationEqual toItem:silverView attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:self.bounds.size.width];
    rightConstraint.priority = 999;
    
    [self addConstraints:@[
                           // Left
                           [NSLayoutConstraint constraintWithItem:silverView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                           
                           // Right
                           rightConstraint,
                           
                           // Top
                           [NSLayoutConstraint constraintWithItem:silverView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                           
                           // Bottom
                           [NSLayoutConstraint constraintWithItem:silverView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0]
                           ]];
    [super updateConstraints];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //_current = 50.0f;
    
    if (_animate)
        [UIView animateWithDuration:0.5 animations:^{
            rightConstraint.constant = self.bounds.size.width - ((_current * self.bounds.size.width) / 100);
            [self layoutIfNeeded];
        }];
    else {
        rightConstraint.constant = self.bounds.size.width - ((_current * self.bounds.size.width) / 100);
        [self layoutIfNeeded];
    }
}

- (void)setCurrent:(CGFloat)current {
    _current = current;
    [self setNeedsLayout];
}

- (void)setAnimate:(BOOL)animate {
    _animate = animate;
    [self setNeedsLayout];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    int r = arc4random() % 100;
    self.current = r;
}


#pragma mark - Container Layer
- (UIColor *)containerColor {
    return [UIColor colorWithCGColor:self.layer.backgroundColor];
}
- (void)setContainerColor:(UIColor *)containerColor {
    self.layer.backgroundColor = containerColor.CGColor;
}
- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}
- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}
- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}
- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

#pragma mark - Silver
//- (void)setSilverColor:(UIColor *)silverColor {
//    _silverColor = silverColor;
//    //[self setNeedsLayout];
//}


@end
