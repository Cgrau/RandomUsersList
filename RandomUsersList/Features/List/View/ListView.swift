import UIKit
import SnapKit

protocol ListViewDelegate: class {
  func didTapButton()
}

private enum Constants {
  static let title = "RandomUsers"
}

class ListView: View {
    
  weak var delegate: ListViewDelegate?
  
  var users: [User] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  private var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .blue
    label.text = Constants.title
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    return label
  }()
  
  private var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  // MARK: View Functions
  override func setupView() {
    addSubview(titleLabel)
    addSubview(tableView)
  }
  
  override func setupConstraints() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(Spacing.s)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    tableView.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(safeAreaLayoutGuide)
    }
  }
}
