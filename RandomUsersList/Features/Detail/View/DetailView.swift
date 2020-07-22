import UIKit

private enum Constants {
  static let pictureSize = CGSize(width: 200, height: 200)
  static let pictureBorderWidth: CGFloat = 3
  enum Titles {
    static let name = "FullName: "
    static let gender = "Gender:"
    static let email = "Email:"
    static let location = "Location:"
    static let street = "Street:"
    static let city = "City:"
    static let state = "State:"
    static let registeredDate = "Registered Date:"
  }
}

class DetailView: View {
  
  var userDetails: UserDetails? {
    didSet {
      setup(with: userDetails)
    }
  }
  
  private var picture: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.layer.masksToBounds = false
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private var container: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    return view
  }()
  
  private var fullNameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.boldSystemFont(ofSize: FontSize.header)
    label.textAlignment = .center
    label.textColor = .white
    label.backgroundColor = Colors.main
    return label
  }()
  
  private var emailTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.email
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    label.numberOfLines = 0
    return label
  }()
  
  private var emailLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    label.numberOfLines = 0
    return label
  }()
  
  private var genderTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.gender
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    return label
  }()
  
  private var genderLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var streetTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.street
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    return label
  }()
  
  private var streetLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var cityTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.city
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    return label
  }()
  
  private var cityLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var stateTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.state
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    return label
  }()
  
  private var stateLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  private var registeredDateTitleLabel: UILabel = {
    let label = UILabel()
    label.text = Constants.Titles.registeredDate
    label.font = UIFont.boldSystemFont(ofSize: FontSize.title)
    label.textColor = Colors.main
    return label
  }()
  
  private var registeredDateLabel: UILabel = {
    let label = UILabel()
    label.font = label.font.withSize(FontSize.regular)
    return label
  }()
  
  // MARK: View Functions
  override func setupView() {
    backgroundColor = Colors.main
    addSubview(fullNameLabel)
    addSubview(container)
    container.addSubview(picture)
    container.addSubview(emailTitleLabel)
    container.addSubview(emailLabel)
    container.addSubview(genderTitleLabel)
    container.addSubview(genderLabel)
    container.addSubview(streetTitleLabel)
    container.addSubview(streetLabel)
    container.addSubview(cityTitleLabel)
    container.addSubview(cityLabel)
    container.addSubview(stateTitleLabel)
    container.addSubview(stateLabel)
    container.addSubview(registeredDateTitleLabel)
    container.addSubview(registeredDateLabel)
  }
  
  override func setupConstraints() {
    fullNameLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaLayoutGuide)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    container.snp.makeConstraints { make in
      make.top.equalTo(fullNameLabel.snp.bottom).offset(Spacing.m)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(safeAreaLayoutGuide)
    }
    picture.snp.makeConstraints { make in
      make.top.equalTo(container).offset(Spacing.m)
      make.centerX.equalToSuperview()
      make.size.equalTo(Constants.pictureSize)
    }
    emailTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(picture.snp.bottom).offset(Spacing.m)
      make.leading.equalTo(fullNameLabel).offset(Spacing.xl)
      make.trailing.equalTo(fullNameLabel)
    }
    emailLabel.snp.makeConstraints { make in
      make.top.equalTo(emailTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(emailTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(emailTitleLabel)
    }
    genderTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(emailLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(emailTitleLabel)
      make.trailing.equalTo(emailTitleLabel)
    }
    genderLabel.snp.makeConstraints { make in
      make.top.equalTo(genderTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(genderTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(genderTitleLabel)
    }
    streetTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(genderLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(emailTitleLabel)
      make.trailing.equalTo(emailTitleLabel)
    }
    streetLabel.snp.makeConstraints { make in
      make.top.equalTo(streetTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(streetTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(streetTitleLabel)
    }
    cityTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(streetLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(emailTitleLabel)
      make.trailing.equalTo(emailTitleLabel)
    }
    cityLabel.snp.makeConstraints { make in
      make.top.equalTo(cityTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(cityTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(cityTitleLabel)
    }
    stateTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(cityLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(emailTitleLabel)
      make.trailing.equalTo(emailTitleLabel)
    }
    stateLabel.snp.makeConstraints { make in
      make.top.equalTo(stateTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(stateTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(stateTitleLabel)
    }
    registeredDateTitleLabel.snp.makeConstraints { make in
      make.top.equalTo(stateLabel.snp.bottom).offset(Spacing.s)
      make.leading.equalTo(emailTitleLabel)
      make.trailing.equalTo(emailTitleLabel)
    }
    registeredDateLabel.snp.makeConstraints { make in
      make.top.equalTo(registeredDateTitleLabel.snp.bottom).offset(Spacing.xs)
      make.leading.equalTo(stateTitleLabel).offset(Spacing.s)
      make.trailing.equalTo(stateTitleLabel)
    }
  }
  
  private func setup(with userDetails: UserDetails?) {
    guard let userDetails = userDetails else { return }
    fullNameLabel.text = userDetails.fullName
    emailLabel.text = userDetails.email
    genderLabel.text = userDetails.gender
    streetLabel.text = userDetails.street
    cityLabel.text = userDetails.city
    stateLabel.text = userDetails.state
    registeredDateLabel.text = userDetails.registeredDate
    let url = URL(string: userDetails.picture)
    picture.kf.setImage(with: url)
  }
  
  func roundImage() {
    picture.layer.borderWidth = Constants.pictureBorderWidth
    picture.layer.borderColor = Colors.main.cgColor
    picture.layer.cornerRadius = picture.frame.width/2
  }
}
