/*********************************************************************
 *
 * 文件名称： GLRootViewController.m
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


#import "NSString+GLLanguage.h"
#import "GLLanguageTool.h"
#import "GLRootViewController.h"

@interface GLRootViewController () 

#pragma mark - UI
@property (nonatomic, strong) IBOutlet UIButton *titleButton;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - Data
@property (nonatomic, strong) NSArray *dataSource;

#pragma mark - Constraint


@end

@implementation GLRootViewController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self gl_init];
    
    
    self.dataSource = @[@"多语言初始化,请在didFinishLaunchingWithOptions初始化",
                        @"多语言切换-简体中文",
                        @"多语言切换-英文",
                        @"多语言读取",
                        ];
}

#pragma mark - Init
- (void)gl_init {
    
}

#pragma mark - Action
- (IBAction)backButtonAction:(UIButton *)sender {
     [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - Public Methods

#pragma mark - Private Methods

#pragma mark - Protocol
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource count];;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *IDCell = @"GLTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:IDCell];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    NSString *msg = self.dataSource[indexPath.row];
    
    switch (indexPath.row) {
        case 0: {
            //多语言配置 支持的多语言设置 ,请在didFinishLaunchingWithOptions初始化
            [GLLanguageTool shareInstance].languageOptions = GLLanguageOptionEN | GLLanguageOptionZH_HANS | GLLanguageOptionZH_HANT | GLLanguageOptionRU | GLLanguageOptionFR | GLLanguageOptionDE | GLLanguageOptionIT | GLLanguageOptionES | GLLanguageOptionJA | GLLanguageOptionKO;
            //设置默认语言，不设置会根据当前系统语言设置当前的语言，当前语言不支持默认英语
//            [GLLanguageTool setCurrentLanguage:GLLanguageOptionZH_HANS];
            
        }
            break;
        case 1: {
            [GLLanguageTool setCurrentLanguage:GLLanguageOptionZH_HANS];
            
        }
            break;
        case 2: {
            [GLLanguageTool setCurrentLanguage:GLLanguageOptionEN];
            
        }
            break;
        case 3: {
            NSString *string = [@"gl_test_1" customLocalizedString];
            NSLog(@"%@", string);
        }
            break;
            
        default:
            break;
    }

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"示例(Language)";
    }
    return @"";
}


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
