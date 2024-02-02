import UIKit

protocol ListUI: AnyObject, AutoMockable {
   func apply(viewModel: ListViewModel)
   func show(error: String)
   
   func showLoading()
   func hideLoading()
}
