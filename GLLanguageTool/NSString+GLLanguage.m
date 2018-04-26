/*********************************************************************
 *
 * 文件名称： NSString+GLLanguage.m
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
 * Blog  ： https://www.dhlee.cn
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


#import "GLLanguageTool.h"
#import "NSString+GLLanguage.h"

@implementation NSString (GLLanguage)

- (NSString *)customLocalizedString {
    return  [self customLocalizedStringFromTable:nil resource:[GLLanguageTool getSettingLanguageCode] bundle:nil];
}

- (NSString *)customLocalizedStringFromTable:(NSString *)table bundle:(NSBundle *)bundle {
    return  [self customLocalizedStringFromTable:table resource:[GLLanguageTool getSettingLanguageCode] bundle:bundle];
}

- (NSString *)customLocalizedStringFromTable:(NSString *)table resource:(NSString *)resource bundle:(NSBundle *)bundle {
    NSString *localizedString = [[NSBundle bundleWithPath:[bundle?:[NSBundle mainBundle] pathForResource:resource ofType:@"lproj"]] localizedStringForKey:(self) value:@"" table:table];
    return localizedString?:@"";
}


@end
