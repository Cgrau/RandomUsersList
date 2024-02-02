import UIKit

// sourcery: AutoMockable
protocol ListTableViewAdapterDelegate: AnyObject {
   func didSelectRow(at indexPath: IndexPath)
   func didDeleteRow(at indexPath: IndexPath)
   func didScrollToBottom()
}

final class ListTableViewAdapter: NSObject {
   private var viewModels = [UserCellViewModel]() {
      didSet {
         tableView?.reloadData()
      }
   }
   
   private let controller: ListRowCellControlling
   
   private weak var tableView: UITableView?
   private weak var delegate: ListTableViewAdapterDelegate?
   
   init(tableView: UITableView,
        delegate: ListTableViewAdapterDelegate?,
        controller: ListRowCellControlling) {
      self.tableView = tableView
      self.delegate = delegate
      self.controller = controller
      super.init()
      setup()
   }
   
   static func buildDefault(tableView: UITableView,
                            delegate: ListTableViewAdapterDelegate?) -> Self {
      let controller = ListRowCellController.buildDefault()
      let adapter = Self(tableView: tableView,
                         delegate: delegate,
                         controller: controller)
      return adapter
   }
   
   func set(viewModels: [UserCellViewModel]) {
      self.viewModels = viewModels
   }
   
   private func setup() {
      guard let tableView else { return }
      tableView.delegate = self
      tableView.dataSource = self
      registerCells()
   }
   
   private func registerCells() {
      guard let tableView else { return }
      controller.registerCell(on: tableView)
   }
}

extension ListTableViewAdapter: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      delegate?.didSelectRow(at: indexPath)
   }
   
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      delegate?.didDeleteRow(at: indexPath)
   }
   
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
      let offsetY = scrollView.contentOffset.y
      let contentHeight = scrollView.contentSize.height
      let height = scrollView.frame.size.height
      
      if offsetY > contentHeight - height {
         delegate?.didScrollToBottom()
      }
   }
}

extension ListTableViewAdapter: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      viewModels.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard viewModels.indices.contains(indexPath.row) else {
         return UITableViewCell()
      }
      let viewModel = viewModels[indexPath.row]
      
      return controller.tableView(tableView, cellForItemAt: indexPath, viewModel: viewModel)
   }
}
