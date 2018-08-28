//
//  ViewController.m
//  ProgressView
//
//  Created by corepress on 2018/8/28.
//  Copyright © 2018年 corepress. All rights reserved.
//

#import "ViewController.h"
#import "TLProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TLProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _progressView.lineWidth = 5.0;
    
    _progressView.lineColor = [UIColor whiteColor];
    
}

- (IBAction)valueChange:(UISlider *)sender {
    
    
    self.lable.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    
    _progressView.progress = sender.value;
}

@end
