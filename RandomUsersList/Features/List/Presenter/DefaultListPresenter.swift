import UIKit

class DefaultListPresenter: ListPresenter {
  
  weak var ui: ListUI?
  private let interactor: ListInteractor
  private let navigator: ListNavigator
  private var isLoading = false
  
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
    navigator.navigateToDetail(user: user)
  }
  
  func delete(user: User) {
    interactor.delete(user: user)
  }
  
  func search(for text: String) {
    interactor.searchUsers(by: text)
  }
  
  func loadMoreUsers() {
    if isLoading == false {
      isLoading.toggle()
      ui?.showLoading()
      interactor.fetchUsers()
    }
  }
}

extension DefaultListPresenter: ListInteractorDelegate {
  func didLoad(users: [User]) {
    isLoading = false
    ui?.hideLoading()
    ui?.show(users: users)
  }
  
  func didFailLoadingUsers(error: Error) {
    isLoading = false
    ui?.hideLoading()
    ui?.show(error: error.message)
  }
  
  func didDeleteUser(users: [User]) {
    ui?.show(users: users)
  }
}
