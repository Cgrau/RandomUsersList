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
}

final class UserViewCell: TableViewCell {
  
  private var fullNameTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.name
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    label.textColor = Colors.secondary
    return label
  }()
  
  private var fullNameLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var emailTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.email
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    label.textColor = Colors.secondary
    label.numberOfLines = 0
    return label
  }()
  
  private var emailLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    label.numberOfLines = 0
    return label
  }()
  
  private var phoneTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.phone
    label.font = UIFont.boldSystemFont(ofSize: FontSize.regular)
    label.textColor = Colors.secondary
    return label
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
    addSubview(fullNameTitleLabel)
    addSubview(fullNameLabel)
    addSubview(emailTitleLabel)
    addSubview(emailLabel)
    addSubview(phoneTitleLabel)
    addSubview(phoneLabel)
    addSubview(picture)
  }
  
  override func setupConstraints() {
    picture.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(Spacing.s)
      make.top.equalToSuperview().offset(Spacing.l)
      make.size.equalTo(Constants.imageSize)
    }
    fullNameTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(picture)
      make.leading.equalTo(picture.snp.trailing).offset(Spacing.s)
      make.trailing.equalToSuperview().offset(-Spacing.s)
    }
    fullNameLabel.snp.makeConstraints { make in
      make.top.equalTo(fullNameTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(fullNameTitleLabel)
      make.trailing.equalTo(fullNameTitleLabel)
    }
    emailTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(fullNameLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(fullNameTitleLabel)
      make.trailing.equalTo(fullNameTitleLabel)
    }
    emailLabel.snp.makeConstraints { make in
      make.top.equalTo(emailTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(fullNameTitleLabel)
      make.trailing.equalTo(fullNameTitleLabel)
    }
    phoneTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(emailLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(fullNameTitleLabel)
      make.trailing.equalTo(fullNameTitleLabel)
    }
    phoneLabel.snp.makeConstraints { make in
      make.top.equalTo(phoneTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(fullNameTitleLabel)
      make.trailing.equalTo(fullNameTitleLabel)
      make.bottom.equalToSuperview().offset(-Spacing.l)
    }
  }
}

extension UserViewCell {
  func configure(fullName: String?,
                 email: String?,
                 phone: String?,
                 image: String?) {
    accessoryType = .disclosureIndicator
    selectionStyle = UITableViewCell.SelectionStyle.none
    fullNameLabel.text = fullName
    emailLabel.text = email
    phoneLabel.text = phone
    guard let image = image else { return }
    let url = URL(string: image)
    picture.kf.setImage(with: url)
  }
}
