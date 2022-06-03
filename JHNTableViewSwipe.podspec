#
# Be sure to run `pod lib lint JHNTableViewSwipe.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JHNTableViewSwipe'
  s.version          = '0.1.1'
  s.summary          = 'UITableView section swipe'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: UITableView 中 section 整体左滑删除
                       DESC

  s.homepage         = 'https://github.com/yiwairenwu/JHNTableViewSwipe'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'JHN' => 'smiler.coco@gmail.com' }
  s.source           = { :git => 'https://github.com/yiwairenwu/JHNTableViewSwipe.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JHNTableViewSwipe/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JHNTableViewSwipe' => ['JHNTableViewSwipe/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
