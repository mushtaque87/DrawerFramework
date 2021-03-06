#
# Be sure to run `pod lib lint DrawerFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DrawerFramework'
  s.version          = '0.1.2'
  s.summary          = 'Testing Cocoa Pods.'
  swift_version      = 4.2
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Drawer Framework to Create Drawer Type App
                       DESC

  s.homepage         = 'https://github.com/mushtaque87/DrawerFramework'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mushtaque Ahmed' => 'mushtaque87@gmail.com' }
  s.source           = { :git => 'https://github.com/mushtaque87/DrawerFramework.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DrawerFramework/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DrawerFramework' => ['DrawerFramework/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
   s.dependency 'Alamofire', '~> 4.8'
   s.dependency 'RxSwift',    '~> 4.3'
   s.dependency 'RxCocoa',    '~> 4.3'
end
