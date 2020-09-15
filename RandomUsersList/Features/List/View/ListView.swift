import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol ListViewDelegate: class {
  func didTap(user: User)
  func didTapDelete(user: User)
  func didSearchFor(text: String)
  func reachedBottomOfTable()
}

private enum Constants {
  static let title = "RandomUsers"
  static let searchPlaceholder = "Search User"
  static let undelineHeight = 2
  static let lastRowSpace = 5
}

private enum ViewState {
  case general, search
}

class ListView: View {
  
  weak var delegate: ListViewDelegate?
  private var state: ViewState = .general
  private var bag = DisposeBag()
  
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
    configureSearchboxReaction()
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
      make.height.equalTo(Constants.undelineHeight)
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
  
  private func configureSearchboxReaction() {
    textField.rx.controlEvent(.editingChanged)
      .asObservable().subscribe({ [weak self] _ in
        guard let text = self?.textField.text else { return }
        self?.state = text.isEmpty ?  .general : .search
        self?.delegate?.didSearchFor(text: text)
      }).disposed(by: bag)
  }
}

//diferenciar estados de la app: busqueda y normal
//unit test en save in userdefaults
//Infinite Scroll with willDisplay

// MARK: - UITableViewDataSource
extension ListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let user = users[indexPath.row]
    let cell = ListCellFactory.cell(with: user)
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
      let userToDelete = users[indexPath.row]
      delegate?.didTapDelete(user: userToDelete)
    }
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //calcular si es la ultima celda
  }
}

// MARK: - TableView - Bottom Reached minus lastRowSpace
extension ListView {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    guard let lastCell = tableView.visibleCells.last, let row = tableView.indexPath(for: lastCell)?.row else { return }
    if row == users.count - Constants.lastRowSpace {
      delegate?.reachedBottomOfTable()
    }
  }
}
