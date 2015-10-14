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
//    CAShapeLayer *silverShape;
//    UIBezierPath *silverLine;
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
    
    _colorBackground = [UIColor whiteColor];
    
    _current = 75.0f;
    _cornerRadius = self.bounds.size.height/2;
    _borderColor = [UIColor grayColor];
    _borderWidth = 1.0f;
    
    _silverColor = [UIColor grayColor];
    
    silverView = [[UIView alloc] initWithFrame:self.bounds];
    silverView.backgroundColor = [UIColor greenColor];
    silverView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self addSubview:silverView];
}

- (void)updateConstraints {

    silverView.translatesAutoresizingMaskIntoConstraints = NO;
    
    rightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeTrailingMargin relatedBy:NSLayoutRelationEqual toItem:silverView attribute:NSLayoutAttributeTrailingMargin multiplier:1.0 constant:0.0];
    
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
    
    CGRect rect = self.bounds;
    
    self.backgroundColor = _colorBackground;

    rightConstraint.constant = self.bounds.size.width - ((_current * self.bounds.size.width) / 100);

    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = (_cornerRadius < rect.size.height/2) ? _cornerRadius : rect.size.height/2;
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = _borderWidth;
    
    silverView.backgroundColor = _silverColor;
}

- (void)setCurrent:(CGFloat)current {
    _current = current;
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    //[self setNeedsLayout];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
//    CGRect rect = silverView.frame;
//    rect.size.width = self.bounds.size.width/2;
//    silverView.frame = rect;
//    [silverView setNeedsLayout];

    [UIView animateWithDuration:0.5 animations:^{
        CGFloat w = (_current * self.bounds.size.width) / 100;
        w = self.bounds.size.width - w;
        rightConstraint.constant = w;
        [self layoutIfNeeded];
    }];
    
}

@end
