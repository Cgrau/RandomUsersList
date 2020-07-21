import UIKit
import RxSwift

protocol ListInteractorDelegate: class {
  func didLoad(users: [User])
  func didFailLoadingUsers(error: Error)
  func didDeleteUser(users: [User])
}

private enum Constants {
  static let numberOfResults = 40
}

class DefaultListInteractor: ListInteractor {
  
  weak var delegate: ListInteractorDelegate?
  private let getRandomUsersUseCase: GetRandomUsersUseCase
  private var users: [User] = []
  private let bag = DisposeBag()
  
  init(getRandomUsersUseCase: GetRandomUsersUseCase) {
    self.getRandomUsersUseCase = getRandomUsersUseCase
  }
  
  func fetchUsers() {
    let request = RandomUsersRequest(results: Constants.numberOfResults)
    getRandomUsersUseCase.execute(request: request).subscribe(onSuccess: { [weak self] users in
      self?.users = users
      self?.delegate?.didLoad(users: users)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingUsers(error: error)
    }.disposed(by: bag)
  }
  
  func delete(user: User) {
    users = users.filter { $0.id != user.id }
    delegate?.didDeleteUser(users: users)
  }
}
