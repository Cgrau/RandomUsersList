import UIKit

protocol DetailInteractor: class{
  var delegate: DetailInteractorDelegate? { get set }
  
  func fetchSomething()
}
