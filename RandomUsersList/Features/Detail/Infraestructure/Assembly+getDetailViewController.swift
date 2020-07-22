import UIKit

protocol DetailProvider {
  func detailViewController(user: User) -> UIViewController
}

extension Assembly: DetailProvider {
  func detailViewController(user: User) -> UIViewController {
    let viewController = DetailViewController()
    viewController.mainView = mainView
    let navigator = mainNavigator(from: viewController)
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  user: user)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: DetailView {
    return DetailView()
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: DetailNavigator,
                             user: User) -> DetailPresenter {
    let presenter = DefaultDetailPresenter(navigator: navigator,
                                           user: user)
    presenter.ui = from as? DetailViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> DetailNavigator {
    return DefaultDetailNavigator(from: from)
  }
}
