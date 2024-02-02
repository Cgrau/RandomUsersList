import UIKit

class DefaultListPresenter: ListPresenter {
   enum State {
      case idle
      case loading
      case searching
   }
   
   weak var ui: ListUI?
   var users: [UserDataModel] = []
   private let interactor: ListInteractor
   private let navigator: ListNavigator
   private let viewModelMapper: ListViewModelMapping
   private var state: State = .idle
   
   required init(interactor: ListInteractor,
                 navigator: ListNavigator,
                 viewModelMapper: ListViewModelMapping) {
      self.interactor = interactor
      self.navigator = navigator
      self.viewModelMapper = viewModelMapper
   }
   
   static func buildDefault(interactor: ListInteractor,
                            navigator: ListNavigator) -> Self {
      .init(interactor: interactor,
            navigator: navigator,
            viewModelMapper: ListViewModelMapper())
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
   
   func didScrollToBottom() {
      if state == .idle {
         state = .loading
         ui?.showLoading()
         interactor.fetchUsers()
      }
   }
   
   func didFocusSearch() {
      interactor.resetPagination()
      state = .searching
   }
   
   func didUnfocusSearch() {
      interactor.resetPagination()
      state = .idle
   }
}

extension DefaultListPresenter: ListInteractorDelegate {
   func didLoad(users: [UserDataModel]) {
      self.users = users
      state = .idle
      ui?.hideLoading()
      let viewModel = viewModelMapper.map(data: users)
      ui?.apply(viewModel: viewModel)
   }
   
   func didLoadSearched(users: [UserDataModel]) {
      self.users = users
      ui?.hideLoading()
      let viewModel = viewModelMapper.map(data: users)
      ui?.apply(viewModel: viewModel)
   }
   
   func didFailLoadingUsers(error: Error) {
      state = .idle
      ui?.hideLoading()
      ui?.show(error: error.message)
   }
   
   func didDeleteUser(users: [UserDataModel]) {
      self.users = users
      let viewModel = viewModelMapper.map(data: users)
      ui?.apply(viewModel: viewModel)
   }
}
