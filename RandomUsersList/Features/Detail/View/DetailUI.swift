import UIKit

protocol DetailUI: class, AutoMockable {
  func show(userDetails: UserDetails)
}
