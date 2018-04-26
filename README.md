# GLLanguageTool

[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com//Gavin-ldh/GLScanner/master/License)
[![CocoaPods](https://img.shields.io/badge/pod-v1.0.5-28B9FE.svg)](http://cocoapods.org/pods/GLScanner)
![Platforms](https://img.shields.io/badge/platforms-iOS-orange.svg)
[![Languages](https://img.shields.io/badge/language-objc-FF69B4.svg?style=plastic)](#)

最好用的多语言支持工具、一个方法获取多语言、应用内部切换多语言。
```
支持：英文、简体中文、繁体中文、俄语、法语、日语、韩语、德语、意大利语、西班牙语切换。
```

<br>

## 一、初始化和使用
初始化在`AppDelegate`导入 `#import <GLLanguageTool.h>`
```
//多语言配置 支持的多语言设置 你需要支持哪些就设置哪些
[GLLanguageTool shareInstance].languageOptions = GLLanguageOptionEN | GLLanguageOptionZH_HANS | GLLanguageOptionZH_HANT | GLLanguageOptionRU | GLLanguageOptionFR | GLLanguageOptionDE | GLLanguageOptionIT | GLLanguageOptionES | GLLanguageOptionKO | GLLanguageOptionJA;
//设置当前语言，不设置会根据当前系统语言设置当前的语言，当前语言不支持默认英语
[GLLanguageTool setCurrentLanguage:GLLanguageOptionZH_HANS];
```

<br>

在需要使用的地方 `#import <NSString+GLLanguage.h>`

```
self.label.text = [@"你的多语言文件key" customLocalizedString];
```
或者
```
self.label.text = [@"你的多语言文件key" customLocalizedStringFromTable:@"多语言文件名"];
```

<br>
<br>

## 二、安装
1. [CocoaPods](https://cocoapods.org/)安装：
```
pod 'GLLanguageTool'

如果搜索不到，请先运行   rm ~/Library/Caches/CocoaPods/search_index.json  在搜索。

```

2. 下载ZIP包,将 `GLLanguageTool` 资源文件拖到工程中。
<br>
<br>

## 三、更新
```
2018.04.20  第一次上传
```

<br>
<br>

## 四、其它
为了不影响您项目中导入的其他第三方库，本库没有导入任何其他的第三方内容，可以放心使用。在使用前，您有任何不明白都可以查看Demo。
* 如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的框架代码看看BUG修复没有）
* 如果您有什么建议可以Issues我，谢谢
* 后续我会持续更新，为它添加更多的功能，欢迎star :)
* 欢迎关注本人的博客：[http://www.dhlee.cn](https://www.dhlee.cn)
