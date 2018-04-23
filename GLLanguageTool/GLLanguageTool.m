/*********************************************************************
 *
 * 文件名称： GLLanguageTool.m
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
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


#import "GLLanguageTool.h"

#define kGLLANGUAGE_SETTING_KEY @"GLLanguageSettingTool"

@implementation GLLanguageTool

static GLLanguageTool *tool = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[GLLanguageTool alloc] init];
        tool.languageOptions = GLLanguageOptionEN;
    });
    return tool;
}

#pragma mark - Public Methods
#pragma mark 写入用户设置语言
+ (void)setUserLanguageCode:(NSString *)languageCode {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:languageCode forKey:kGLLANGUAGE_SETTING_KEY];
    [userDefaults synchronize];
}

#pragma mark 获取用户设置语言
+ (NSString *)getUserSettingLanguageCode {
    NSString *language =  [[NSUserDefaults standardUserDefaults] objectForKey:kGLLANGUAGE_SETTING_KEY];
    if (language.length == 0) {
        language = [self getCurrentLanguage];
        [self setUserLanguageCode:language];
    }
    return language;
}

#pragma mark  获取系统的语言
+ (NSString *)getCurrentLanguage {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if ((tool.languageOptions & GLLanguageOptionEN) && [currentLanguage isEqualToString:@"en"]) {
        //英语 - 默认
        return @"en";
    }else if ((tool.languageOptions & GLLanguageOptionZH_HANS) && [currentLanguage isEqualToString:@"zh-Hans"]) {
        //简体中文
        return @"zh-Hans";
    }else if ((tool.languageOptions & GLLanguageOptionZH_HANS) && [currentLanguage isEqualToString:@"ru"]) {
        //俄语
        return @"ru";
    } else if ((tool.languageOptions & GLLanguageOptionRU) && [currentLanguage hasPrefix:@"fr"]){
        //法语
        return @"fr";
    }else if ((tool.languageOptions & GLLanguageOptionZH_HANT) && ([currentLanguage isEqualToString:@"zh-Hant"] || [currentLanguage isEqualToString:@"zh-HK"])) {
        //繁体中文
        return @"zh-Hant";
    }else if ((tool.languageOptions & GLLanguageOptionDE) && [currentLanguage hasPrefix:@"de"]) {
        //German 德语
        return @"de";
    }else if((tool.languageOptions & GLLanguageOptionIT) && [currentLanguage hasPrefix:@"it"]) {
        //italian 意大利
        return @"it";
    }else if((tool.languageOptions & GLLanguageOptionES) && [currentLanguage hasPrefix:@"es"]) {
        //Spanish 西班牙语
        return @"es";
    }else if ((tool.languageOptions & GLLanguageOptionJA) && [currentLanguage isEqualToString:@"ja"]) {
        //日语
        return @"ja";
    }else if ((tool.languageOptions & GLLanguageOptionKO) && [currentLanguage isEqualToString:@"ko"]) {
        //韩语
        return @"ko";
    }
//    else if ([[currentLanguage substringToIndex:2] isEqualToString:@"pt"])
//    {
//        //葡萄牙-pt （巴西）  pt-PT （葡萄牙）
//        return @"pt";
//    }
    
    //所有不支持默认英文
    return @"en";
}


#pragma mark - Private Methods


@end
