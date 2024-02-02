import UIKit

class DefaultListNavigator: ListNavigator {
  
  private let from: UIViewController
  
  init(from: UIViewController) {
    self.from = from
  }
  
  func navigateToDetail(user: UserDataModel) {
    let detailViewController = container.detailViewController(user: user)
    from.navigationController?.pushViewController(detailViewController, animated: true)
  }
}
