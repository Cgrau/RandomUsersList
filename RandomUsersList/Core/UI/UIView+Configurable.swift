import Foundation

public protocol ConfigurableView {
    associatedtype ViewModel
    func apply(viewModel: ViewModel)
}
