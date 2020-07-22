import UIKit

protocol DetailProvider {
  func detailViewController(user: User) -> UIViewController
}

extension Assembly: DetailProvider {
  func detailViewController(user: User) -> UIViewController {
    let viewController = DetailViewController()
    viewController.mainView = mainView
    let navigator = mainNavigator(from: viewController)
    let interactor = mainInteractor()
    let presenter = mainPresenter(from: viewController,
                                  navigator: navigator,
                                  interactor: interactor,
                                  user: user)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: DetailView {
    return DetailView()
  }
  
  private func mainPresenter(from: UIViewController,
                             navigator: DetailNavigator,
                             interactor: DetailInteractor,
                             user: User) -> DetailPresenter {
    let presenter = DefaultDetailPresenter(interactor: interactor,
                                           navigator: navigator,
                                           user: user)
    interactor.delegate = presenter
    presenter.ui = from as? DetailViewController
    
    return presenter
  }
  
  private func mainNavigator(from: UIViewController) -> DetailNavigator {
    return DefaultDetailNavigator(from: from)
  }
  
  private func mainInteractor() -> DetailInteractor {
    return DefaultDetailInteractor()
  }
}
