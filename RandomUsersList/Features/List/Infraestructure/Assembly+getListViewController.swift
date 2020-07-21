import UIKit

protocol ListProvider {
  func getListViewController() -> UIViewController
}

extension Assembly: ListProvider {
  func getListViewController() -> UIViewController {
    let viewController = ListViewController()
    viewController.mainView = mainView
    let navigator = mainNavigator(from: viewController)
    let interactor = mainInteractor()
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  interactor: interactor)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: ListView {
    return ListView()
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: ListNavigator,
                             interactor: ListInteractor) -> ListPresenter {
    let presenter = DefaultListPresenter(interactor: interactor, navigator: navigator)
    interactor.delegate = presenter
    presenter.ui = from as? ListViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> ListNavigator {
    return DefaultListNavigator(from: from)
  }
  
  private func mainInteractor() -> ListInteractor {
    return DefaultListInteractor(getRandomUsersUseCase: resolver.getRandomUsers,
                                 localStorage: localStorage)
  }
  
  private var localStorage: LocalStorage {
    return UserDefaultsLocalStorage(userDefaults: UserDefaults.standard)
  }
}
