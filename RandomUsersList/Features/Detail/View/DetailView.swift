import UIKit

protocol DetailViewDelegate: class {
  func didTapButton()
}

private enum Constants {
  static let proportionRate = 3
}

class DetailView: View {
  
  weak var delegate: DetailViewDelegate?
  
  private var picture: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  // MARK: View Functions
  override func setupView() {
    backgroundColor = Colors.main
    addSubview(picture)
  }
  
  override func setupConstraints() {
    picture.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide).offset(Spacing.s)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.height.equalToSuperview().dividedBy(Constants.proportionRate)
    }
  }
}
