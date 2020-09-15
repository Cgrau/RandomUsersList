import UIKit

protocol ConfigurableListCell: UITableViewCell {
  func configure(data: User)
}

protocol ListCellProvider {
  static func cell(with data: User) -> ConfigurableListCell
}

class ListCellFactory: ListCellProvider {
  static func cell(with data: User) -> ConfigurableListCell {
    let cell = UserViewCell()
    cell.configure(data: data)
    return cell
  }
}
