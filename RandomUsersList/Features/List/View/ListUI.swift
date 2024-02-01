import UIKit

protocol ListUI: AnyObject, AutoMockable {
  func show(users: [UserCellViewModel])
  func show(error: String)
  
  func showLoading()
  func hideLoading()
}
