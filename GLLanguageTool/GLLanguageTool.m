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
+ (void)setCurrentLanguage:(GLLanguageOptions)language {
    NSAssert(tool.languageOptions&language, @"当前设置的语言不支持或者初始化没有这种语言，请设置初始化支持的多语言。。。");
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:language forKey:kGLLANGUAGE_SETTING_KEY];
    [userDefaults synchronize];
}
/**   获取用户设置的语言  */
+ (GLLanguageOptions)getSettingLanguage {
    GLLanguageOptions language =  [[NSUserDefaults standardUserDefaults] integerForKey:kGLLANGUAGE_SETTING_KEY];
    if (language == GLLanguageOptionNone) {
        language = [self getCurrentLanguage];
        [self setCurrentLanguage:language];
    }
    return language;
}

/**  获取用户设置语言的CODE  */
+ (NSString *)getSettingLanguageCode {
    GLLanguageOptions language = [self getSettingLanguage];
    return [self languageKeyWithOption:language];
}

#pragma mark  获取系统的语言
+ (GLLanguageOptions)getCurrentLanguage {
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if ((tool.languageOptions & GLLanguageOptionEN) && [currentLanguage isEqualToString:@"en"]) {
        //英语 - 默认
        return GLLanguageOptionEN;
    }else if ((tool.languageOptions & GLLanguageOptionZH_HANS) && [currentLanguage isEqualToString:@"zh-Hans"]) {
        //简体中文
        return GLLanguageOptionZH_HANS;
    }else if ((tool.languageOptions & GLLanguageOptionRU) && [currentLanguage isEqualToString:@"ru"]) {
        //俄语
        return GLLanguageOptionRU;
    } else if ((tool.languageOptions & GLLanguageOptionFR) && [currentLanguage hasPrefix:@"fr"]){
        //法语
        return GLLanguageOptionFR;
    }else if ((tool.languageOptions & GLLanguageOptionZH_HANT) && ([currentLanguage isEqualToString:@"zh-Hant"] || [currentLanguage isEqualToString:@"zh-HK"])) {
        //繁体中文
        return GLLanguageOptionZH_HANT;
    }else if ((tool.languageOptions & GLLanguageOptionDE) && [currentLanguage hasPrefix:@"de"]) {
        //German 德语
        return GLLanguageOptionDE;
    }else if((tool.languageOptions & GLLanguageOptionIT) && [currentLanguage hasPrefix:@"it"]) {
        //italian 意大利
        return GLLanguageOptionIT;
    }else if((tool.languageOptions & GLLanguageOptionES) && [currentLanguage hasPrefix:@"es"]) {
        //Spanish 西班牙语
        return GLLanguageOptionES;
    }else if ((tool.languageOptions & GLLanguageOptionJA) && [currentLanguage isEqualToString:@"ja"]) {
        //日语
        return GLLanguageOptionJA;
    }else if ((tool.languageOptions & GLLanguageOptionKO) && [currentLanguage isEqualToString:@"ko"]) {
        //韩语
        return GLLanguageOptionKO;
    }
    //所有不支持默认英文
    return GLLanguageOptionEN;
}


#pragma mark - Private Methods
+ (NSString *)languageKeyWithOption:(GLLanguageOptions)language {
    if (language == GLLanguageOptionEN) {
        return @"en";
    }else if (language == GLLanguageOptionZH_HANS) {
        return @"zh-Hans";
    }else if (language == GLLanguageOptionRU) {
        return @"ru";
    }else if (language == GLLanguageOptionFR) {
        return @"fr";
    }else if (language == GLLanguageOptionZH_HANT) {
        return @"zh-Hant";
    }else if (language == GLLanguageOptionDE) {
        return @"de";
    }else if (language == GLLanguageOptionIT) {
        return @"it";
    }else if (language == GLLanguageOptionES) {
        return @"es";
    }else if (language == GLLanguageOptionJA) {
        return @"ja";
    }else if (language == GLLanguageOptionKO) {
        return @"ko";
    }
    return @"";
    
}

@end
