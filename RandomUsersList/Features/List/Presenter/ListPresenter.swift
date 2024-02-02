import UIKit

protocol ListPresenter: AnyObject, AutoMockable {
  var ui: ListUI? { get set }
  var users: [UserDataModel] { get set }
  
  func didLoad()
  func didSelectUser(with indexPath: IndexPath)
  func didSelectDeleteUser(with indexPath: IndexPath)
  func search(for text: String)
  func loadMoreUsers()
}
