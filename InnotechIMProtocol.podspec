#
# Be sure to run `pod lib lint InnotechIMProtocol.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InnotechIMProtocol'
  s.version          = '0.1.9'
  s.summary          = 'a iOS library that lets iOS clients access a qRPC service. You can find out much more about qRPC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.homepage         = 'https://github.com/pjocer/qrpc-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jiguanhu' => 'jiguanhu@innotechx.com' }
  s.source           = { :git => 'https://github.com/pjocer/qrpc-ios.git', :tag => s.version.to_s }

  s.requires_arc        = true
  s.ios.deployment_target = '8.0'
  s.xcconfig = { 'ENABLE_BITCODE' => 'NO', 'OTHER_LDFLAGS' =>'-ObjC'}
  
  s.vendored_frameworks = 'InnotechIMProtocol/Framework/InnotechIMProtocol.framework'
end
