import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol ListViewDelegate: AnyObject {
  func didTapUser(with indexPath: IndexPath)
  func didTapDelete(with indexPath: IndexPath)
  func didSearchFor(text: String)
  func reachedBottomOfTable()
}

class ListView: View {
  
  weak var delegate: ListViewDelegate?
  private var bag = DisposeBag()
  
  private enum Constants {
    static let title = "RandomUsers"
    static let searchPlaceholder = "Search User"
    static let undelineHeight = 2
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
  
  var tableView: UITableView = {
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
        self?.delegate?.didSearchFor(text: text)
      }).disposed(by: bag)
  }
}
