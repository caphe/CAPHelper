//
//  SKNewViewController.m
//  SkipHelper
//
//  Created by kdatm on 2018/5/18.
//  Copyright © 2018年 kdatm. All rights reserved.
//

#import "SKNewViewController.h"
#define SKScreenWidth [UIScreen mainScreen].bounds.size.width
#define SKScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SKNewViewController ()
@property (nonatomic,strong)UIImageView *backgroudImage;
@property (nonatomic,strong)UIButton *startBtn;
@end
@implementation SKNewViewController

- (UIImageView *)backgroudImage {
    if (!_backgroudImage) {
        _backgroudImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_header"]];
    }
    return _backgroudImage;
}

- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _startBtn.backgroundColor = [UIColor colorWithRed:0/255.0 green:136/255.0 blue:241/255.0 alpha:1];
        [_startBtn setTitle:@"开始赚钱" forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _startBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _startBtn.layer.masksToBounds = YES;
        _startBtn.layer.cornerRadius = 10;
    }
    return _startBtn;
}

- (void)startBtnClick {
    NSLog(@"startTo");
}

- (void)viewDidLoad {
     [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
     [self initFrame];
     [self addViews];
}

- (void)initFrame {
    CGSize imageSize = self.backgroudImage.image.size;
    CGFloat sizeScale = imageSize.height/imageSize.width;
    self.backgroudImage.frame = CGRectMake(SKScreenWidth/8,(SKScreenHeight- SKScreenWidth*sizeScale)/2, SKScreenWidth*3/4, SKScreenWidth*sizeScale*3/4);
    
    self.startBtn.frame = CGRectMake(SKScreenWidth/5, self.backgroudImage.frame.origin.y+self.backgroudImage.frame.size.height+40, SKScreenWidth*3/5, 50);
}

- (void)addViews {
    [self.view addSubview:self.backgroudImage];
    [self.view addSubview:self.startBtn];
}


@end
