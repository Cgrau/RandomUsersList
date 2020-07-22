import UIKit

protocol ListInteractor: class, AutoMockable {
  var delegate: ListInteractorDelegate? { get set }
  var users: [User] { get set }
  
  func fetchUsers()
  func delete(user: User)
  func searchUsers(by text: String)
}
