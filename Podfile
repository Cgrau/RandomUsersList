# Uncomment the next line to define a global platform for your project
platform :ios

def testing_pods
 use_frameworks!
end

def app_pods
  use_frameworks!
  pod 'SwiftLint'
  pod 'Sourcery'
end

target 'RandomUsersList' do
  app_pods
end

target 'RandomUsersListTests' do
  testing_pods
end
