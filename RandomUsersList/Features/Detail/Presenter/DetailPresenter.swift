import UIKit

protocol DetailPresenter: class {
  var ui: DetailUI? { get set }
  
  func didLoad()
}
