import UIKit

protocol ListPresenter: class, AutoMockable {
  var ui: ListUI? { get set }
  
  func didLoad()
}
