//
//  TLBingView.m
//  ProgressView
//
//  Created by corepress on 2018/8/28.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLBingView.h"

@implementation TLBingView

- (NSArray *)randomArr {
    NSMutableArray *arrm = @[].mutableCopy;
    
    int total = 100;
    
    int temp = 0;
    
    for (int i=0; i<arc4random_uniform(10)+1; i++) {
        temp = arc4random_uniform(total) + 1;  //在0-100里面取随机数 不能去0
        [arrm addObject:@(temp)];
        if(temp == total) { //当取出来的随机数等于总数 退出循环
            break;
        }
        total-=temp;//每次取到一个随机数 就立即减去这个随机数 所有随机数加起来等于100
    }
    
    if (total > 0) { //如果没有取完 就加上剩下的部分
        [arrm addObject:@(total)];
    }
    
    return arrm;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    NSArray *arr = [self randomArr];
    CGFloat radius = self.bounds.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat startA = 0;
    CGFloat angle = 0;
    CGFloat endA = startA + angle;
    
    for (int i=0; i < arr.count; i++) {
        startA = endA;//起始角度=结束角度
        angle = [arr[i] doubleValue] / 100.0 * M_PI*2; //计算弧度
        endA = startA + angle;//起始角度+旋转弧度
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        //添加一条线到圆心
        [path addLineToPoint:center];
        [[self colorRandom] setFill];
        [path fill];
    }
    
}

- (UIColor *)colorRandom {
    
    CGFloat r = arc4random_uniform(265) / 255.0;
    CGFloat g = arc4random_uniform(265) / 255.0;
    CGFloat b = arc4random_uniform(265) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}
@end
