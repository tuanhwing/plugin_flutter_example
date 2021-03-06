#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint plugin_example.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'plugin_example'
  s.version          = '0.0.5'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'

  s.preserve_paths = 'frameworks/VNPTframework.framework'
  s.xcconfig = { 'OTHER_LDFLAGS' => '-framework VNPTframework' }
  s.vendored_frameworks = 'frameworks/VNPTframework.framework'


  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
