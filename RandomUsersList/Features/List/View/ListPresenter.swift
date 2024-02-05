import UIKit

// sourcery: AutoMockable
protocol ListPresenting {
   var ui: ListUI? { get set }
   var users: [UserDataModel] { get set }
   
   func didLoad()
   func didSelectUser(with indexPath: IndexPath)
   func didSelectDeleteUser(with indexPath: IndexPath)
   func search(for text: String)
   func didScrollToBottom()
   func didFocusSearch()
   func didUnfocusSearch()
}

// sourcery: AutoMockable
protocol ListUI: AnyObject {
   func apply(viewModel: ListViewModel)
   func show(error: String)
   
   func showLoading()
   func hideLoading()
}

class ListPresenter: ListPresenting {
   enum State {
      case idle
      case loading
      case searching
   }
   
   weak var ui: ListUI?
   var users: [UserDataModel] = []
   private let interactor: ListInteracting
   private let navigator: ListNavigating
   private let viewModelMapper: ListViewModelMapping
   private var state: State = .idle
   
   required init(interactor: ListInteracting,
                 navigator: ListNavigating,
                 viewModelMapper: ListViewModelMapping) {
      self.interactor = interactor
      self.navigator = navigator
      self.viewModelMapper = viewModelMapper
   }
   
   static func buildDefault(interactor: ListInteracting,
                            navigator: ListNavigating) -> Self {
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

extension ListPresenter: ListInteractorDelegate {
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
