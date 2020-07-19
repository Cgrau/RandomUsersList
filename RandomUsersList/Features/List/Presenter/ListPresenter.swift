import UIKit

protocol ListPresenter: class {
  var ui: ListUI? { get set }
  
  func didLoad()
}
