//
//  TLProgressView.h
//  ProgressView
//
//  Created by corepress on 2018/8/28.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLProgressView : UIView

/**/
@property(nonatomic,assign)CGFloat progress;

/**/
@property(nonatomic,assign)CGFloat lineWidth;

@property(nonatomic,strong)UIColor *lineColor;

@end
