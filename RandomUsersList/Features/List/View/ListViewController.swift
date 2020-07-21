import UIKit

class ListViewController: UIViewController {
  
  var mainView: ListView?
  
  var presenter: ListPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  override func viewDidLoad() {
    presenter?.didLoad()
  }
}

extension ListViewController: ListUI {
  func show(users: [User]) {
    mainView?.users = users
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

extension ListViewController: ListViewDelegate {
  
  func didTap(user: User) {
    presenter?.didSelect(user: user)
  }
  
  func didTapDelete(user: User) {
    presenter?.delete(user: user)
  }
}
