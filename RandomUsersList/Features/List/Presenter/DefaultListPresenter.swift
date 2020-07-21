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
    interactor.fetchUsers()
  }
  
  func didSelect(user: User) {
    
  }
}

extension DefaultListPresenter: ListInteractorDelegate {
  func didLoad(users: [User]) {
    ui?.show(users: users)
  }
  
  func didFailLoadingUsers(error: Error) {
    ui?.show(error: error.message)
  }
}
