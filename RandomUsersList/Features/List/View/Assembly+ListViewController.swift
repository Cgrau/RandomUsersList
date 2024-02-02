import UIKit

protocol ListProvider {
   func listViewController() -> UIViewController
}

extension Assembly: ListProvider {
   func listViewController() -> UIViewController {
      let viewController = ListViewController()
      let navigator = mainNavigator(from: viewController)
      let interactor = mainInteractor()
      let presenter = mainPresenter(from: viewController,
                                    navigator: navigator,
                                    interactor: interactor)
      
      viewController.presenter = presenter
      let navigationController = UINavigationController(rootViewController: viewController)
      configure(navigationController: navigationController)
      return navigationController
   }
   
   private func mainPresenter(from: UIViewController,
                              navigator: ListNavigator,
                              interactor: ListInteractor) -> ListPresenter {
      let presenter = ListPresenter.buildDefault(interactor: interactor,
                                                 navigator: navigator)
      interactor.delegate = presenter
      presenter.ui = from as? ListViewController
      
      return presenter
   }
   
   private func mainNavigator(from: UIViewController) -> ListNavigator {
      ListNavigator(from: from)
   }
   
   private func mainInteractor() -> ListInteractor {
      ListInteractor(getRandomUsers: resolver.getRandomUsers,
                     localStorage: localStorage)
   }
   
   private var localStorage: LocalStorage {
      UserDefaultsLocalStorage.buildDefault()
   }
   
   private func configure(navigationController: UINavigationController) {
      navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      navigationController.navigationBar.shadowImage = UIImage()
      navigationController.navigationBar.isTranslucent = true
      navigationController.navigationBar.tintColor = .white
      navigationController.navigationBar.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: FontSize.title),
                                                                .foregroundColor: UIColor.white]
   }
}
