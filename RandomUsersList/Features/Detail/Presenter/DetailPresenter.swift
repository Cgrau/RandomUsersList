import UIKit

protocol DetailPresenter: AnyObject {
  var ui: DetailUI? { get set }
  
  func didLoad()
}
