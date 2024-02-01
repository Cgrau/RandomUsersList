import UIKit

class DefaultListPresenter: ListPresenter {
   
   weak var ui: ListUI?
   var users: [User] = []
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
   
   func didSelectUser(with indexPath: IndexPath) {
      guard users.indices.contains(indexPath.row) else { return }
      let selectedUser = users[indexPath.row]
      navigator.navigateToDetail(user: selectedUser)
   }
   
   func didSelectDeleteUser(with indexPath: IndexPath) {
      guard users.indices.contains(indexPath.row) else { return }
      let userToDelete = users[indexPath.row]
      interactor.delete(user: userToDelete)
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
      self.users = users
      isLoading = false
      ui?.hideLoading()
      let mappedUsers = users.map {
         UserCellViewModel(fullName: $0.fullName,
                           email: $0.email,
                           phone: $0.phone,
                           imageURL: $0.picture?.thumbnail)
      }
      ui?.show(users: mappedUsers)
   }
   
   func didFailLoadingUsers(error: Error) {
      isLoading = false
      ui?.hideLoading()
      ui?.show(error: error.message)
   }
   
   func didDeleteUser(users: [User]) {
      self.users = users
      let mappedUsers = users.map {
         UserCellViewModel(fullName: $0.fullName,
                           email: $0.email,
                           phone: $0.phone,
                           imageURL: $0.picture?.thumbnail)
      }
      ui?.show(users: mappedUsers)
   }
}
