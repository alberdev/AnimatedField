#
# Be sure to run `pod lib lint AnimatedField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    
# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.platform = :ios
s.ios.deployment_target = '10.0'
s.name              = 'AnimatedField'
s.summary           = 'Animated UITextField with check & filter with regular expressions for default types (email, url, password, price, date...) for iOS'
s.description       = 'AnimatedField create a view with a UITextField and title. It make animations with the placeholder, also check & filter with regular expressions for default types (email, url, password, price, date...)'
s.version           = '1.0.3'

# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.license           = { :type => 'MIT', :file => 'LICENSE' }

# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.author            = { 'Alberto Aznar' => 'info@alberdev.com' }
s.homepage          = 'https://github.com/alberdev/AnimatedField'
s.social_media_url  = 'https://twitter.com/alberdev'

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source            = { :git => 'https://github.com/alberdev/AnimatedField.git', :tag => s.version.to_s }

# ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.framework         = 'UIKit'

# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.source_files      = 'AnimatedField/**/*'

# ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

# s.resources         = 'AnimatedField/Resources/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'

# ――― Swift Version ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.swift_version     = '4.2'
    
end
