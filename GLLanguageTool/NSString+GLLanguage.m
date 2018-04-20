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
    return  [self localizedStringFromTable:nil resource:[GLLanguageTool getUserSettingLanguageCode]];
}

- (NSString *)customLocalizedStringFromTable:(NSString *)table {
    return  [self localizedStringFromTable:table resource:[GLLanguageTool getUserSettingLanguageCode]];
}

- (NSString *)localizedStringFromTable:(NSString *)table resource:(NSString *)resource  {
    NSString *localizedString = [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:resource ofType:@"lproj"]] localizedStringForKey:(self) value:@"" table:table];
    //处理没有开启多语言
    if (localizedString.length == 0) {
        return self;
    }
    return localizedString;
}


@end
