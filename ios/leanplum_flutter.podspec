#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint leanplum_flutter.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'leanplum_flutter'
  s.version          = '0.0.2'
  s.summary          = 'A flutter plugin for the Leanplum SDK'
  s.description      = <<-DESC
A flutter plugin for the Leanplum SDK
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Pedro Culque' => 'gonzales4r@hotmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency  'Leanplum-iOS-SDK', '2.6.4'
  s.platform = :ios, '8.0'
  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
