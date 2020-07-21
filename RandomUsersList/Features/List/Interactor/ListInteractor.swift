import UIKit

protocol ListInteractor: class, AutoMockable {
  var delegate: ListInteractorDelegate? { get set }
  
  func fetchUsers()
  func delete(user: User)
}
