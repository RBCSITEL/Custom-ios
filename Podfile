# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'ESPRainMaker' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ESPRainMaker

  pod 'MBProgressHUD', '~> 1.1.0'
  pod 'Alamofire', '~> 5.0.0'
  pod 'Toast-Swift'
  pod 'ReachabilitySwift'
  pod 'JWTDecode', '~> 2.4'
  pod 'M13Checkbox'
  pod 'ESPProvision', '2.0.16'
  pod 'DropDown'
  pod 'FlexColorPicker'
  pod 'SwiftCharts', '~> 0.6.5'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end
