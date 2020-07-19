import UIKit

protocol ListInteractor: class, AutoMockable {
  var delegate: ListInteractorDelegate? { get set }
  
  func fetchSomething()
}
