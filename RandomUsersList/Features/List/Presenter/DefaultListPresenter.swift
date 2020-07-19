import UIKit

class DefaultListPresenter: ListPresenter {
  
  weak var ui: ListUI?
  private let interactor: ListInteractor
  private let navigator: ListNavigator
  
  init(interactor: ListInteractor,
       navigator: ListNavigator) {
    self.interactor = interactor
    self.navigator = navigator
  }
  
  func didLoad() {
    interactor.fetchSomething()
  }
}

extension DefaultListPresenter: ListInteractorDelegate {
  
  func somethingFetched() {
    ui?.showSomething()
  }
}
