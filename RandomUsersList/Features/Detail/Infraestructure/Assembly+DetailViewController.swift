import UIKit

protocol DetailProvider {
  func detailViewController(user: User) -> UIViewController
}

extension Assembly: DetailProvider {
  func detailViewController(user: User) -> UIViewController {
    let viewController = DetailViewController()
    viewController.mainView = mainView
    let presenter = mainPresenter(from: viewController,
                                  user: user)
    
    viewController.presenter = presenter
    return viewController
  }
  
  private var mainView: DetailView {
    return DetailView()
  }
  
  private func mainPresenter(from: UIViewController,
                             user: User) -> DetailPresenter {
    let presenter = DefaultDetailPresenter(user: user)
    presenter.ui = from as? DetailViewController
    
    return presenter
  }
}
