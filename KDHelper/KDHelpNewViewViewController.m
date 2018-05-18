//
//  KDHelpNewViewViewController.m
//  KDHelpTool
//
//  Created by kdatm on 2018/5/18.
//  Copyright © 2018年 kdatm. All rights reserved.
//

#import "KDHelpNewViewViewController.h"
#define KDScreenWidth [UIScreen mainScreen].bounds.size.width
#define KDScreenHeight [UIScreen mainScreen].bounds.size.height
@interface KDHelpNewViewViewController ()
@property (nonatomic,strong)UIImageView *backgroundImageView;
@end

@implementation KDHelpNewViewViewController

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_header"]];
    }
    return _backgroundImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

- (void)initViews {
    CGSize imageSize = self.backgroundImageView.image.size;
    CGFloat imageSizeScale = imageSize.height/imageSize.width;
     
    if(KDScreenHeight-imageSizeScale*KDScreenWidth>0) {
        self.backgroundImageView.frame = CGRectMake(0, (KDScreenHeight-KDScreenHeight*imageSizeScale)/2, KDScreenWidth,KDScreenWidth*imageSizeScale);
    }
    else {
        self.backgroundImageView.frame = CGRectMake(0, 0, KDScreenWidth, KDScreenHeight);
    }
    
}

@end
