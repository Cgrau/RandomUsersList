import UIKit

protocol ListInteractorDelegate: class {
  func somethingFetched()
}

class DefaultListInteractor: ListInteractor{
  
  weak var delegate: ListInteractorDelegate?
  
  func fetchSomething() {
    delegate?.somethingFetched()
  }
}
