# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

def testing_pods
 use_frameworks!
 pod 'RxBlocking', '5.0'
 pod 'OHHTTPStubs/Swift'
end

def app_pods
  use_frameworks!
  pod 'SwiftLint'
  pod 'Sourcery'
  pod 'RxSwift',    '5.0'
  pod 'RxCocoa',    '5.0'
  pod 'Moya', '14.0.0'
  pod 'Moya/RxSwift', '14.0.0'
  pod 'SnapKit', '~> 5.0.0'
  pod 'Kingfisher'
end

target 'RandomUsersList' do
  app_pods
end

target 'RandomUsersListTests' do
  testing_pods
end
