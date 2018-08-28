//
//  TLProgressView.m
//  ProgressView
//
//  Created by corepress on 2018/8/28.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLProgressView.h"

@implementation TLProgressView

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat radius = self.bounds.size.width * 0.5;
    
    CGPoint center = CGPointMake(radius, radius);
    
    //结束角度
    CGFloat endAngle = _progress * (M_PI*2) - M_PI_2;
    
    //clockwise YES顺时针 NO逆时针
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius-self.lineWidth startAngle:-M_PI_2 endAngle:endAngle clockwise:YES];
    
    path.lineWidth = self.lineWidth;

    [self.lineColor setStroke];
    
    [path stroke];
    
}


@end
