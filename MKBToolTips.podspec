#
# Be sure to run `pod lib lint MKBToolTips.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MKBToolTips"
  s.version          = "0.1.0"
  s.summary          = "An easy way to show a tooltip for any UIView"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "An easy way to show a tooltip for a UIView at a specified angle"

  s.homepage         = "https://github.com/Megatron1000/MKBToolTips"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Mark Bridges" => "support@mark-bridges.com" }
  s.source           = { :git => "https://github.com/Megatron1000/MKBToolTips.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/markbridgesapps

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MKBToolTips' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'PureLayout', '~> 3.0'
end
