# RandomUsersList

Application written in Swift and designed using clean architecture.

This app is a list of random users provided by http://randomuser.me/.
Tap a user to know more info about him/her.
Slide to delete if you don't want to see his/her anymore.

:warning: Please run "pod install" in order to get all the dependencies.

:warning: Requirements -  Use Xcode 11+ (iOS Deployment target is 13.0)

## Application overview :rocket:

### ListView
<img src="https://github.com/Cgrau/assets/blob/master/RandomUsersList/ListScreen.png" width="225" height="487">

Once the application loads, you get a list of 40 random users plus the ones you had in previous sessions.

The table is "infinite", it means that when you are about to reach the last user, you will get 40 more form the endpoint.

### Search for a User
<img src="https://github.com/Cgrau/assets/blob/master/RandomUsersList/searchForUser.png?raw=true" width="225" height="487">

You also have a searchbar in ListView, so you can search for your favorite buddy. It tries to find any result in user's full name and email.

### Swipe to delete
<img src="https://github.com/Cgrau/assets/blob/master/RandomUsersList/swipeToDelete.png?raw=true" width="225" height="487">

You can swipe to delete one of the users and never see him/her again, even after reloading the app again.

### UserDetails
<img src="https://github.com/Cgrau/assets/blob/master/RandomUsersList/detailScreen.png" width="225" height="487">

When a User is select the app will navigate to a new screen where you will see information regarding him/her.

## Architecture and implementation details

The application is written in Swift and designed using VIPER :heart: architecture - Using my VIPER-Template(https://github.com/Cgrau/VIPER_template). The functionality is divided in different scenes:

- List scene

Represents the core of the application. Here is where you can see the list of random users.

- Details scene

Show the detailed user information.

## Third party libraries

Main:
- Sourcery - https://github.com/krzysztofzablocki/Sourcery (Generate Swift files. In our case: AutoMockable)
- SnapKit - https://github.com/SnapKit/SnapKit (Constraints by code)
- RxSwift & RxCocoa - https://github.com/ReactiveX/RxSwift (Reactive Programming - Used in NetworkLayer and UI components)
- Moya & Moya/RxSwift https://github.com/Moya/Moya (NetworkLayer)
- SwiftLint https://github.com/realm/SwiftLint (Linter for Swift)
- Kingfisher https://github.com/onevcat/Kingfisher (Image loader and cache)

Test:
- RxBlocking - https://github.com/ReactiveX/RxSwift/tree/master/RxBlocking (So we can use Single in observables)
- OHHTTPStubs - https://github.com/AliSoftware/OHHTTPStubs (Stubs for API Calls)
- Swift Snapshot Testing - https://github.com/pointfreeco/swift-snapshot-testing

## Support & contact

You can contact me via e-mail: carles828@gmail.com
