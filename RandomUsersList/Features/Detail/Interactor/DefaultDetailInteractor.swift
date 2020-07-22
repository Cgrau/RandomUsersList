import UIKit

protocol DetailInteractorDelegate: class {
  func somethingFetched()
}

class DefaultDetailInteractor: DetailInteractor{
  
  weak var delegate: DetailInteractorDelegate?
  
  func fetchSomething() {
    delegate?.somethingFetched()
  }
}
