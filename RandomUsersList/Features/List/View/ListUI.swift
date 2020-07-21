import UIKit

protocol ListUI: class, AutoMockable {
  func show(users: [User])
  func show(error: String)
}
