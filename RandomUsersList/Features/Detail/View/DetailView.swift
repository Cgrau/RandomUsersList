import UIKit

protocol DetailViewDelegate: class {
  func didTapButton()
}

private enum Constants {
  static let proportionRate = 3
}

class DetailView: View {
  
  weak var delegate: DetailViewDelegate?
  var userDetails: UserDetails? {
    didSet {
      setup(with: userDetails)
    }
  }
  
  private var picture: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
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
  
  private func setup(with userDetails: UserDetails?) {
    guard let userDetails = userDetails else { return }
    let url = URL(string: userDetails.picture)
    picture.kf.setImage(with: url)
  }
}
