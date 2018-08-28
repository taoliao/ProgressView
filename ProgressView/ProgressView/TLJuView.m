//
//  TLJuView.m
//  ProgressView
//
//  Created by corepress on 2018/8/28.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "TLJuView.h"

@implementation TLJuView
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
        total-=temp;
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
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 0;
    CGFloat h = 0;
    
    for (int i=0;i<arr.count;i++) {
        
        w = rect.size.width /(2*arr.count - 1);
        x = w*2*i;
        h = [arr[i] floatValue]/100.0 * rect.size.height;
        y = rect.size.height - h;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        [[self randomColor]set];
        [path fill];
    }
    
}

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(265)/255.0;
    CGFloat g = arc4random_uniform(265)/255.0;
    CGFloat b = arc4random_uniform(265)/255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

@end
