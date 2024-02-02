import UIKit
import SnapKit
import RxSwift
import RxCocoa

protocol ListViewDelegate: AnyObject {
   func didTapUser(with indexPath: IndexPath)
   func didTapDelete(with indexPath: IndexPath)
   func didSearchFor(text: String)
   func didFocusSearch()
   func didUnfocusSearch()
}

final class ListView: View {
   weak var delegate: ListViewDelegate?
   var tableView = UITableView()
   private var bag = DisposeBag()
   
   private enum Constants {
      static let undelineHeight = 2
   }
   
   private var titleLabel: UILabel = {
      let label = UILabel()
      label.textColor = .white
      label.textAlignment = .center
      label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
      return label
   }()
   
   private var underline: UIView = {
      let view = UIView()
      view.backgroundColor = .white
      return view
   }()
   
   private var textField: UISearchTextField = {
      let textField = UISearchTextField()
      textField.autocorrectionType = .no
      textField.font = UIFont.systemFont(ofSize: FontSize.regular)
      return textField
   }()
   
   // MARK: View Functions
   override func setupView() {
      backgroundColor = Colors.main
      addSubview(titleLabel)
      addSubview(underline)
      addSubview(textField)
      addSubview(tableView)
      setupKeyboardBehaviour(to: tableView)
      configureSearchboxReaction()
      textField.delegate = self
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

extension ListView: UITextFieldDelegate {
   func textFieldDidBeginEditing(_ textField: UITextField) {
      delegate?.didFocusSearch()
   }
   
   func textFieldDidEndEditing(_ textField: UITextField) {
      delegate?.didUnfocusSearch()
   }
}

extension ListView: ConfigurableView {
   func apply(viewModel: ListViewModel) {
      titleLabel.text = viewModel.title
      textField.placeholder = viewModel.placeholder
   }
}
