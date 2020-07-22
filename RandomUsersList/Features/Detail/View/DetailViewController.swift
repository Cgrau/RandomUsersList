import UIKit

class DetailViewController: UIViewController, DetailUI {
  
  var mainView: DetailView?
  
  var presenter: DetailPresenter?
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
    title = "User Details"
  }
  
  override func loadView() {
    mainView?.delegate = self
    view = mainView
  }
  
  func showSomething() {
    
  }
}

extension DetailViewController: DetailViewDelegate {
  
  func didTapButton() {
    //call presenter
  }
}
