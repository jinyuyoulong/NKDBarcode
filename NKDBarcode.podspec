#
# Be sure to run `pod lib lint NKDBarcode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NKDBarcode'
  s.version          = '0.1.0'
  s.summary          = '一个条形码扫描工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
这是一个日本人写的生成条形码的库, 写得还不错, 各种常用码都可以生成, 而且调用起来也很方便, 
唯一不足的就是这个库是MRC的, 所以我改成ARC了，供大家使用。
                       DESC

  s.homepage         = 'https://github.com/jinyuyoulong/NKDBarcode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jinyuyoulong' => 'fan.jinlong@qq.com' }
  s.source           = { :git => 'https://github.com/jinyuyoulong/NKDBarcode.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NKDBarcode/Classes/**/*'
  
  # s.resource_bundles = {
  #   'NKDBarcode' => ['NKDBarcode/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
