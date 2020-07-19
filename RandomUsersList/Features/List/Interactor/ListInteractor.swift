import UIKit

protocol ListInteractor: class{
  var delegate: ListInteractorDelegate? { get set }
  
  func fetchSomething()
}
