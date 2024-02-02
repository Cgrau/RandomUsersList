import UIKit

// sourcery: AutoMockable
protocol ListNavigating {
   func navigateToDetail(user: UserDataModel)
}

class ListNavigator: ListNavigating {
   
   private let from: UIViewController
   
   init(from: UIViewController) {
      self.from = from
   }
   
   func navigateToDetail(user: UserDataModel) {
      let detailViewController = container.detailViewController(user: user)
      from.navigationController?.pushViewController(detailViewController, animated: true)
   }
}
