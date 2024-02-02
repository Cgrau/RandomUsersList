import UIKit

protocol ListNavigator: AnyObject, AutoMockable {
  func navigateToDetail(user: UserDataModel)
}
