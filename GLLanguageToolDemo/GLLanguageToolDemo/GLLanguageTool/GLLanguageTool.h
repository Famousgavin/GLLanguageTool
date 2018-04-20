/*********************************************************************
 *
 * 文件名称： GLLanguageTool.h
 * 项目名称： GLAlertToolDemo
 * 作   者： Gavin Li
 * Blog  ： http://www.dhlee.cn
 * GitHub： https://github.com/Gavin-ldh
 * 当前版本： 1.0.0
 * 创建日期： 2018/4/19
 * 完成日期： // 输入完成日期，例：2018年08月08日
 * 内容摘要： // 简要描述本文件的内容，包括主要模块、函数及其功能的说明
 * 其它说明： // 其它内容的说明
 *
 * Copyright © 2018年 Gavin Lee. All rights reserved.
 *
 **********************************************************************/


#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GLLanguageOptions) {
    /**  英文  */
    GLLanguageEN          = 0x01 << 0,
    /**  简体中文  */
    GLLanguageZH_HANS     = 0x01 << 1,
    /**  繁体中文  */
    GLLanguageZH_HANT     = 0x01 << 2,
    /**  俄语  */
    GLLanguageRU          = 0x01 << 3,
    /**  法语  */
    GLLanguageFR          = 0x01 << 4,
    /**  德语  */
    GLLanguageDE          = 0x01 << 5,
    /**  意大利  */
    GLLanguageIT          = 0x01 << 6,
    /**  西班牙  */
    GLLanguageES          = 0x01 << 7,
    /**  日语  */
    GLLanguageJA          = 0x01 << 8,
    /**  韩语  */
    GLLanguageKO          = 0x01 << 9,
};

@interface GLLanguageTool : NSObject

/**  支持的语言 示例：GLLanguageZH_HANT | GLLanguageEN  默认值：GLLanguageEN  */
@property (nonatomic, assign) GLLanguageOptions languages;


+ (instancetype)shareInstance;

/**  写入用户设置当前语言 languageCode：系统语言文件key 如：en、zh-Hans、ru... 默认跟随系统，当前系统语言不支持 默认英语 */
+ (void)setUserLanguageCode:(NSString *)languageCode;
/**  获取用户设置语言  */
+ (NSString *)getUserSettingLanguageCode;

/**  获取系统的语言 根据支持的语言过滤 默认英语 */
+ (NSString *)getCurrentLanguage;


@end
