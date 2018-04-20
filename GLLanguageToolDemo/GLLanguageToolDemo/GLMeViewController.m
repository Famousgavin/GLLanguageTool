/*********************************************************************
 *
 * 文件名称： GLMeViewController.m
 * 项目名称： GLLanguageToolDemo
 * 作   者： Gavin Li(博客：http://www.dhlee.cn)
 * Blog  ： http://www.dhlee.cn
 * GitHub： https://github.com/Gavin-ldh
 * Copyright © 2018年 Gavin Lee. All rights reserved.
 *
 *
 * 修改记录1：// 修改历史记录，包括修改日期、修改者及修改内容
 *    修改日期：
 *    版 本 号：
 *    修 改 人：
 *    修改内容：//修改原因以及修改内容说明
 * 修改记录2：…
 *
 **********************************************************************/



#import "GLMeViewController.h"

@interface GLMeViewController () 

#pragma mark - UI
@property (nonatomic, strong) IBOutlet UIButton *titleButton;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

#pragma mark - Data

#pragma mark - Constraint


@end

@implementation GLMeViewController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *strng = @"https://github.com/Gavin-ldh";
//    UIImage *iconImage = [UIImage imageNamed:@"icon"];
//    CGFloat width = self.view.frame.size.width/5.0;
//    iconImage = [iconImage imageByResizeToSize:CGSizeMake(width, width) contentMode:UIViewContentModeScaleAspectFill];
//
//    [GLQrScanner qrImageWithString:strng icon:iconImage scale:0.15 completion:^(UIImage *image) {
//        self.imageView.image = image;
//    }];
//
//    [self.imageView setLongPressActionWithBlock:^{
//
//        [GLQrScanner scaneImage:self.imageView.image completion:^(NSArray *values) {
//            [self openURLString:values.lastObject];
//        }];
//
//    }];
//
//    self.contentLabel.text = @"感谢黑夜的来临，\n\n我知道今天不论有多失败，\n\n全新的明天仍然等待我来证明自己。";
    
    [self gl_init];
}

#pragma mark - Init
- (void)gl_init {
    
}

#pragma mark - Action
- (IBAction)backButtonAction:(UIButton *)sender {
     [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clickProjectButton:(UIButton *)sender {
    [self openURLString:@"https://github.com/Gavin-ldh/GLScanner"];
}

#pragma mark - Public Methods

#pragma mark - Private Methods
- (void)openURLString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
#else
        [[UIApplication sharedApplication] openURL:url];
#endif
    }
}

#pragma mark - Protocol

#pragma mark - Notice
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - Rewrite
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Lazy Loading


@end
