import UIKit

protocol DetailUI: AnyObject, AutoMockable {
  func show(userDetails: UserDetails)
}
