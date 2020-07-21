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
    ui?.showLoading()
    interactor.fetchUsers()
  }
  
  func didSelect(user: User) {
    
  }
  
  func delete(user: User) {
    interactor.delete(user: user)
  }
  
  func search(for text: String) {
    interactor.searchUsers(by: text)
  }
}

extension DefaultListPresenter: ListInteractorDelegate {
  func didLoad(users: [User]) {
    ui?.hideLoading()
    ui?.show(users: users)
  }
  
  func didFailLoadingUsers(error: Error) {
    ui?.hideLoading()
    ui?.show(error: error.message)
  }
  
  func didDeleteUser(users: [User]) {
    ui?.show(users: users)
  }
}
