import UIKit

// sourcery: AutoMockable
protocol ListRowCellControlling: AnyObject {
   func tableView(_ tableView: UITableView,
                  cellForItemAt indexPath: IndexPath,
                  viewModel: UserCellViewModel) -> UITableViewCell
   func registerCell(on tableView: UITableView)
}

final class ListRowCellController: ListRowCellControlling {
   typealias Cell = UserViewCell
   
   static func buildDefault() -> Self {
      .init()
   }
   
   func tableView(_ tableView: UITableView,
                  cellForItemAt indexPath: IndexPath,
                  viewModel: UserCellViewModel) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier,
                                                     for: indexPath) as? Cell else { return UITableViewCell() }
      cell.apply(viewModel: viewModel)
      return cell
   }
   
   func registerCell(on tableView: UITableView) {
      tableView.register(Cell.self,
                         forCellReuseIdentifier: Cell.reuseIdentifier)
   }
}
