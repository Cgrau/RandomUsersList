import UIKit

protocol ListViewDelegate: class {
  func didTapButton()
}

class ListView: UIView {
    
  weak var delegate: ListViewDelegate?
}
