#
# Be sure to run `pod lib lint JXPhotoSelector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JXPhotoSelector'
  s.version          = '1.0'
  s.summary          = 'A photos && videos picker for iOS device.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        This is a photos && videos picker for iOS device, it supports iOS 7.0 above devices.
                       DESC

  s.homepage         = 'https://github.com/xiangfly11/JXPhotoSelector'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xiangfly11' => 'xiangfly1104@gmail.com' }
  s.source           = { :git => 'https://github.com/xiangfly11/JXPhotoSelector.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'JXPhotoSelector/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JXPhotoSelector' => ['JXPhotoSelector/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
