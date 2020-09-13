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
    s.swift_version = '4.0'

    s.source_files = 'AppSpSDK/AppSpSDK/**/*.swift'
end
