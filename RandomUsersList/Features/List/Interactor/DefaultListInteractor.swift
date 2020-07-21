import UIKit
import RxSwift

protocol ListInteractorDelegate: class {
  func didLoad(users: [User])
  func didFailLoadingUsers(error: Error)
}

private enum Constants {
  static let numberOfResults = 40
}

class DefaultListInteractor: ListInteractor {
  
  weak var delegate: ListInteractorDelegate?
  private let getRandomUsersUseCase: GetRandomUsersUseCase
  private let bag = DisposeBag()
  
  init(getRandomUsersUseCase: GetRandomUsersUseCase) {
    self.getRandomUsersUseCase = getRandomUsersUseCase
  }
  
  func fetchUsers() {
    let request = RandomUsersRequest(results: Constants.numberOfResults)
    getRandomUsersUseCase.execute(request: request).subscribe(onSuccess: { [weak self] users in
      self?.delegate?.didLoad(users: users)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingUsers(error: error)
    }.disposed(by: bag)
  }
}
