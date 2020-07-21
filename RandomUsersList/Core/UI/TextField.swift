import UIKit

private enum Constants {
  static let cornerRadius: CGFloat = 10
  static let verticalPadding: CGFloat = 5
  static let horizontalPadding: CGFloat = 10
}

/// UITextField subclass with padding on text
class TextField: UITextField {
  
  private let padding = UIEdgeInsets(top: Constants.verticalPadding,
                                     left: Constants.horizontalPadding,
                                     bottom: Constants.verticalPadding,
                                     right: Constants.horizontalPadding)
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    layer.cornerRadius = Constants.cornerRadius
    backgroundColor = .white
  }
  
  override open func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override open func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
