Pod::Spec.new do |s|

  s.name          = "GLLanguageTool"
  s.version       = "1.0.4"
  s.summary       = "最好用的多语言工具、一个方法获取多语言、应用内部切换多语言"
  s.description   = <<-DESC
                     最好用的多语言工具、一个方法获取多语言、应用内部切换多语言,系统多语言文件读取，支持12国语言切换。
                    DESC

  s.homepage      = "https://github.com/Gavin-ldh/GLLanguageTool"
  s.license       = "MIT"
  s.author        = { "Gavin" => "gavin.ldh@hotmail.com" }
  s.social_media_url = "https://www.dhlee.cn"
  s.platform      = :ios
  s.ios.deployment_target = "8.0"
  s.source        = { :git => "https://github.com/Gavin-ldh/GLLanguageTool.git", :tag => s.version }
  s.source_files  = "GLLanguageTool/*.{h,m}"
  s.public_header_files = "GLLanguageTool/*.{h}"
  s.framework     = "UIKit"
  s.requires_arc  = true

end
