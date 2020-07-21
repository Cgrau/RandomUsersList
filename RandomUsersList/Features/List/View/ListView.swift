import UIKit
import SnapKit

protocol ListViewDelegate: class {
  func didTap(user: User)
}

private enum Constants {
  static let title = "RandomUsers"
  static let searchPlaceholder = "Search User"
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
    label.textColor = .white
    label.text = Constants.title
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    return label
  }()
  
  private var underline: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  private var textField: TextField = {
    let textField = TextField()
    textField.autocorrectionType = .no
    textField.font = UIFont.systemFont(ofSize: FontSize.regular)
    textField.placeholder = Constants.searchPlaceholder
    return textField
  }()
  
  private var tableView: UITableView = {
    let tableView = UITableView()
    return tableView
  }()
  
  // MARK: View Functions
  override func setupView() {
    backgroundColor = Colors.main
    addSubview(titleLabel)
    addSubview(underline)
    addSubview(textField)
    addSubview(tableView)
    tableView.register(UserViewCell.self)
    tableView.dataSource = self
    tableView.delegate = self
    setupKeyboardBehaviour(to: tableView)
  }
  
  override func setupConstraints() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(Spacing.s)
      make.centerX.equalToSuperview()
    }
    underline.snp.makeConstraints { make in
      make.top.equalTo(titleLabel.snp.bottom)
      make.leading.equalTo(titleLabel).offset(-Spacing.l)
      make.trailing.equalTo(titleLabel).offset(Spacing.l)
      make.height.equalTo(2)
    }
    textField.snp.makeConstraints { make in
      make.top.equalTo(underline.snp.bottom).offset(Spacing.s)
      make.leading.equalToSuperview().offset(Spacing.l)
      make.trailing.equalToSuperview().offset(-Spacing.l)
    }
    tableView.snp.makeConstraints { make in
      make.top.equalTo(textField.snp.bottom).offset(Spacing.s)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(safeAreaLayoutGuide)
    }
  }
}

// MARK: - UITableViewDataSource
extension ListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let user = users[indexPath.row]
    guard let cell = tableView.dequeueReusableCell(withIdentifier: UserViewCell.cellIdentifier) as? UserViewCell else {
      return UITableViewCell()
    }
    
    cell.configure(fullName: user.fullName,
                   email: user.email,
                   phone: user.phone,
                   image: user.picture?.thumbnail)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

// MARK: - UITableViewDelegate
extension ListView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedUser = users[indexPath.row]
    delegate?.didTap(user: selectedUser)
  }
}

// MARK: - Swipe to Delete
extension ListView {
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == UITableViewCell.EditingStyle.delete {
      //delete user and never show him/her again
    }
  }
}

