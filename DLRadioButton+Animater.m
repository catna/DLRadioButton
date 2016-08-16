//
//  DLRadioButton+Animater.m
//  Cowa
//
//  Created by MX on 16/8/16.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "DLRadioButton+Animater.h"
#import <objc/runtime.h>

static const void *DLRadioButtonAnimateKey = "DLRadioButtonAnimateKey";
static NSString *DLRadioButtonAnimateLayerKey = @"DLRadioButtonAnimateLayerKey";

@implementation DLRadioButton (Animater)
@dynamic animate;

- (void)setAnimate:(BOOL)animate {
    objc_setAssociatedObject(self, DLRadioButtonAnimateKey, @(animate), OBJC_ASSOCIATION_ASSIGN);
    for (CALayer *maskLayer in self.layer.sublayers) {
        if ([maskLayer.name isEqualToString:DLRadioButtonAnimateLayerKey]) {
            [maskLayer removeFromSuperlayer];
        }
    }
    
    if (animate) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = self.layer.bounds;
        maskLayer.name = DLRadioButtonAnimateLayerKey;
        UIBezierPath *miniPartCirclePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(maskLayer.bounds), CGRectGetMidY(maskLayer.bounds)) radius:(self.iconSize - self.iconStrokeWidth)/2 startAngle:maskLayerArcAngleStart endAngle:maskLayerArcAngleEnd clockwise:YES];
        maskLayer.path = miniPartCirclePath.CGPath;
        maskLayer.lineWidth = self.iconStrokeWidth + 0.8;
        maskLayer.lineCap = kCALineCapSquare;
        maskLayer.strokeColor = maskLayerLineColor;
        maskLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:maskLayer];
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        animation.fromValue = (id) 0;
        animation.toValue = @(M_PI*2);
        animation.duration = maskLayerDuration;
        animation.repeatCount = INFINITY;
        animation.fillMode = kCAFillModeRemoved;
        animation.autoreverses = NO;
        [maskLayer addAnimation:animation forKey:@"rotate"];
    }
}

- (BOOL)animate {
    id animate = objc_getAssociatedObject(self, DLRadioButtonAnimateKey);
    return ((NSNumber *)animate).boolValue;
}

@end
