import UIKit

protocol ListNavigator: class, AutoMockable {
  func navigateToDetail(user: User)
}
