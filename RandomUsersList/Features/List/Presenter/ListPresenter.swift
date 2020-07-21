import UIKit

protocol ListPresenter: class, AutoMockable {
  var ui: ListUI? { get set }
  
  func didLoad()
  func didSelect(user: User)
  func delete(user: User)
}
