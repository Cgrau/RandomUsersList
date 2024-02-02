import UIKit

//private enum Constants {
//   static let deleteMessage = "Don't you really want to see %@ anymore?"
//}

class ListViewController: UIViewController {
   private let mainView = ListView()
   var presenter: ListPresenter?
   
   private lazy var adapter = ListTableViewAdapter.buildDefault(tableView: mainView.tableView,
                                                                delegate: self)
   
   override func loadView() {
      mainView.delegate = self
      view = mainView
   }
   
   override func viewDidLoad() {
      presenter?.didLoad()
   }
   
   override func viewWillAppear(_ animated: Bool) {
      navigationController?.navigationBar.isHidden = true
   }
}

extension ListViewController: ListUI {
   func apply(viewModel: ListViewModel) {
      mainView.apply(viewModel: viewModel)
      adapter.set(viewModels: viewModel.users)
   }
   
   func show(error: String) {
      show(errorMessage: error)
   }
   
   func showLoading() {
      showLoadingView()
   }
   
   func hideLoading() {
      hideLoadingView()
   }
}

extension ListViewController: ListTableViewAdapterDelegate {
   func didSelectRow(at indexPath: IndexPath) {
      presenter?.didSelectUser(with: indexPath)
   }
   
   func didDeleteRow(at indexPath: IndexPath) {
      presenter?.didSelectDeleteUser(with: indexPath)
   }
   
   func didScrollToBottom() {
      presenter?.didScrollToBottom()
   }
}

extension ListViewController: ListViewDelegate {
   func didTapUser(with indexPath: IndexPath) {
      presenter?.didSelectUser(with: indexPath)
   }
   
   func didTapDelete(with indexPath: IndexPath) {
      presenter?.didSelectDeleteUser(with: indexPath)
   }
   
   func didSearchFor(text: String) {
      presenter?.search(for: text)
   }
   
   func didFocusSearch() {
      presenter?.didFocusSearch()
   }
   
   func didUnfocusSearch() {
      presenter?.didUnfocusSearch()
   }
}
