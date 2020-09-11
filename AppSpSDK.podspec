Pod::Spec.new do |s|
    s.name         = 'AppSpSDK'
    s.version      = '1.0.0'
    s.summary      = 'ios AppSpSDK versionUpdate Notice'
    s.homepage     = 'https://github.com/BlackXzq/AppSp_SDK'
    s.license      = 'MIT'
    s.authors      = {'blackxu' => '747373635@qq.com'}
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://github.com/BlackXzq/AppSp_SDK.git', :tag => s.version}
    s.requires_arc = true

    s.default_subspec = 'All'

    s.subspec 'Types' do |type|
    type.source_files = 'LBXScan/*.{h,m}'
    end

    s.subspec 'All' do |all|
      all.source_files = 'LBXScan/LBXNative/*.{h,m}','LBXScan/LBXZXing/**/*.{h,m}','LBXScan/UI/*.{h,m}'
      all.libraries = 'iconv','z'
      all.resource     = 'LBXScan/UI/CodeScan.bundle'
      all.dependency 'LBXScan/Types','~> 2.2'
      all.ios.frameworks = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'ImageIO', 'QuartzCore'
      all.prefix_header_contents = '#import "LBXScanNative.h"','#import "ZXingWrapper.h"','#import "LBXScanView.h"'
    end

    s.subspec 'LBXNative' do |lbxNative|
      lbxNative.source_files = 'LBXScan/LBXNative/*.{h,m}'
      lbxNative.ios.frameworks = 'AVFoundation'
      lbxNative.prefix_header_contents = '#import "LBXScanNative.h"'
      lbxNative.dependency 'LBXScan/Types','~> 2.2'
    end

    s.subspec 'LBXZXing' do |lbxZXing|
      lbxZXing.source_files = 'LBXScan/LBXZXing/**/*.{h,m}'
      lbxZXing.ios.frameworks = 'AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'ImageIO', 'QuartzCore'
      lbxZXing.prefix_header_contents = '#import "ZXingWrapper.h"'
      lbxZXing.dependency 'LBXScan/Types','~> 2.2'
    end
  
    s.subspec 'UI' do |ui|
      ui.source_files = 'LBXScan/UI/*.{h,m}'
      ui.resource     = 'LBXScan/UI/CodeScan.bundle'
      ui.prefix_header_contents = '#import "LBXScanView.h"'
      ui.dependency 'LBXScan/Types','~> 2.2'
    end

end
