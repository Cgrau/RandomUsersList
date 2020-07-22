import UIKit

private enum MessageType: String {
  case message = "RandomUsersList"
  case error = "RandomUsersList - Error"
}

extension UIViewController {
  func show(errorMessage: String) {
    showAlert(with: errorMessage, type: .error)
  }
  
  func show(message: String, completion: (() -> Void)? = nil) {
    showAlert(with: message, type: .message, completion: completion)
  }
  
  func show(questionMessage: String, completion: (() -> Void)? = nil) {
    showQuestionAlert(with: questionMessage, type: .message, completion: completion)
  }
  
  private func showAlert(with message: String, type: MessageType, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: type.rawValue,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "👍🏼", style: .default, handler: { _ in
      completion?()
    }))
    self.present(alert, animated: true)
  }
  
  private func showQuestionAlert(with message: String, type: MessageType, completion: (() -> Void)? = nil) {
    let alert = UIAlertController(title: type.rawValue,
                                  message: message,
                                  preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Burn!", style: .destructive, handler: { _ in
      completion?()
    }))
    alert.addAction(UIAlertAction(title: "I forgive him", style: .cancel))
    self.present(alert, animated: true)
  }
}
