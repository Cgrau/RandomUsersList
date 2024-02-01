# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'

def testing_pods
 use_frameworks!
 pod 'RxBlocking', '5.1.3'
 pod 'OHHTTPStubs/Swift', '9.1.0'
 pod 'SnapshotTesting', '1.9.0'
end

def app_pods
  use_frameworks!
  pod 'SwiftLint', '0.54.0'
  pod 'Sourcery', '2.1.7'
  pod 'RxSwift', '5.1.3'
  pod 'RxCocoa', '5.1.3'
  pod 'Moya', '14.0.0'
  pod 'Moya/RxSwift', '14.0.0'
  pod 'SnapKit', '5.6.0'
  pod 'Kingfisher', '7.10.2'
end

target 'RandomUsersList' do
  app_pods
end

target 'RandomUsersListTests' do
  testing_pods
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
            end
        end
    end
end
