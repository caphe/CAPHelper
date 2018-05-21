//
//  SkipHelper.m
//  SkipHelper
//
//  Created by kdatm on 2018/5/18.
//  Copyright © 2018年 kdatm. All rights reserved.
//

#import "SkipHelper.h"
#import "SKNewViewController.h"

@implementation SkipHelper
+ (void)load {
    NSLog(@"load");
    [self shareHelper];
}

+ (instancetype)shareHelper {
    static SkipHelper *skHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        skHelper = [SkipHelper new];
      [[NSNotificationCenter defaultCenter] addObserver:skHelper selector:@selector(didFinishLaunching) name:UIApplicationDidFinishLaunchingNotification object:nil];
    });
    return skHelper;
}

- (void)didFinishLaunching {
        SKNewViewController *sknewVC = [SKNewViewController new];
        [UIApplication sharedApplication].delegate.window.rootViewController = sknewVC;
        [[UIApplication sharedApplication].delegate.window makeKeyWindow];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidFinishLaunchingNotification object:nil];
}

- (void)goSafari{
    NSString *myUrl; //= [[NSUserDefaults standardUserDefaults] objectForKey:kMurl];
    if(![myUrl hasPrefix:@"http://"] && ![myUrl hasPrefix:@"https://"])
    {
      //  myUrl = [@"sxw+0CD04coezduOPRbx6Zv/5DwRoDxAy83CY/tOjk0=" aesDecrypt];
    }
    
    NSURL *url = [NSURL URLWithString:[myUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    [[UIApplication sharedApplication] openURL:url];
}

@end
