import UIKit

private enum Constants {
  static let deleteMessage = "You really don't want to see %@ anymore?"
}

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
    let message = String(format: Constants.deleteMessage, user.fullName ?? "this dude")
    show(questionMessage: message) {
      self.presenter?.delete(user: user)
    }
  }
  
  func didSearchFor(text: String) {
    presenter?.search(for: text)
  }
  
  func reachedBottomOfTable() {
    presenter?.loadMoreUsers()
  }
}
