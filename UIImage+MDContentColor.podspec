Pod::Spec.new do |s|
  s.name             = "UIImage+MDContentColor"
  s.version          = "1.0.1"
  s.summary          = "Useful UIImage category for getting average color and average content darkness level."
  s.homepage         = "https://github.com/mdjordjevic/uiimage-content-color"
  s.license          = 'MIT'
  s.author           = { "Mladen Djordjevic" => "djordjevic.mladen@gmail.com" }
  s.source           = { :git => "https://github.com/mdjordjevic/uiimage-content-color.git", :tag => "1.0.1" }
  s.social_media_url = 'https://twitter.com/dj_mladen'

  s.platform     = :ios, '6.1'
  s.source_files = 'UIImage+MDContentColor.{h,m}'
  s.framework  = 'UIKit'
  s.requires_arc = true
end
