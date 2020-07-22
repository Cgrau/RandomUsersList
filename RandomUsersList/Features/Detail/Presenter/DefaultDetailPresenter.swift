import UIKit

class DefaultDetailPresenter: DetailPresenter {
  
  weak var ui: DetailUI?
  private let interactor: DetailInteractor
  private let navigator: DetailNavigator
  private let user: User
  
  init(interactor: DetailInteractor,
       navigator: DetailNavigator,
       user: User) {
    self.interactor = interactor
    self.navigator = navigator
    self.user = user
  }
  
  func didLoad() {
    interactor.fetchSomething()
  }
}

extension DefaultDetailPresenter: DetailInteractorDelegate {
  
  func somethingFetched() {
    ui?.showSomething()
  }
}
