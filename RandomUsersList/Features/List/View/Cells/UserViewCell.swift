import UIKit
import Kingfisher

private enum Constants {
  static let imageSize = CGSize(width: 50, height: 50)
  enum Titles {
    static let name = "FullName: "
    static let email = "Email:"
    static let phone = "Phone:"
  }
  static let pictureCornerRadius: CGFloat = 4
  static let phoneIcon = "phoneIcon"
  static let phoneIconSize = CGSize(width: 18, height: 18)
}

final class UserViewCell: TableViewCell {
  
  private var fullNameLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var emailLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    label.numberOfLines = 0
    return label
  }()
  
  private var phoneIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: Constants.phoneIcon)
    return imageView
  }()
  
  private var phoneLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var picture: UIImageView = {
    let imageView = UIImageView()
    imageView.layer.cornerRadius = Constants.pictureCornerRadius
    imageView.layer.masksToBounds = true
    return imageView
  }()
  
  override func setupView() {
    addSubview(fullNameLabel)
    addSubview(emailLabel)
    addSubview(phoneIcon)
    addSubview(phoneLabel)
    addSubview(picture)
  }
  
  override func setupConstraints() {
    picture.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(Spacing.s)
      make.top.equalToSuperview().offset(Spacing.l)
      make.size.equalTo(Constants.imageSize)
    }
    fullNameLabel.snp.makeConstraints { make in
      make.top.equalTo(picture)
      make.leading.equalTo(picture.snp.trailing).offset(Spacing.s)
      make.trailing.equalToSuperview().offset(-Spacing.s)
    }
    emailLabel.snp.makeConstraints { make in
      make.top.equalTo(fullNameLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(fullNameLabel)
      make.trailing.equalTo(fullNameLabel)
    }
    phoneIcon.snp.makeConstraints { make in
      make.centerY.equalTo(phoneLabel)
      make.leading.equalTo(fullNameLabel)
      make.size.equalTo(Constants.phoneIconSize)
    }
    phoneLabel.snp.makeConstraints { make in
      make.top.equalTo(emailLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(phoneIcon.snp.trailing).offset(Spacing.s)
      make.trailing.equalTo(fullNameLabel)
      make.bottom.equalToSuperview().offset(-Spacing.l)
    }
  }
}

extension UserViewCell {
  func apply(viewModel: UserCellViewModel) {
    accessoryType = .disclosureIndicator
    selectionStyle = .none
    fullNameLabel.text = viewModel.fullName
    emailLabel.text = viewModel.email
    phoneLabel.text = viewModel.phone
    guard let imageURL = viewModel.imageURL else { return }
    let url = URL(string: imageURL)
    picture.kf.setImage(with: url)
  }
}
