import UIKit

class ListViewController: UIViewController, ListUI {
  
  var mainView: ListView?
  
  var presenter: ListPresenter?
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  func showSomething() {
    
  }
}

extension ListViewController: ListViewDelegate {
  
  func didTapButton() {
    //call presenter
  }
}
