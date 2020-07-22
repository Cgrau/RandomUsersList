import UIKit

class DetailViewController: UIViewController, DetailUI {
  
  var mainView: DetailView?
  
  var presenter: DetailPresenter?
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.backgroundColor = Colors.main
    DispatchQueue.main.async {
      self.mainView?.roundImage()
    }
  }
  
  override func loadView() {
    view = mainView
  }
  
  override func viewDidLoad() {
    presenter?.didLoad()
  }
  
  func show(userDetails: UserDetails) {
    mainView?.userDetails = userDetails
  }
}
