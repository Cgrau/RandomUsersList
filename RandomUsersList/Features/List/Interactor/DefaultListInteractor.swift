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
  private let localStorage: LocalStorage
  private var users: [User] = []
  private let bag = DisposeBag()
  
  init(getRandomUsersUseCase: GetRandomUsersUseCase,
       localStorage: LocalStorage) {
    self.getRandomUsersUseCase = getRandomUsersUseCase
    self.localStorage = localStorage
  }
  
  func fetchUsers() {
    let request = RandomUsersRequest(results: Constants.numberOfResults)
    getRandomUsersUseCase.execute(request: request).subscribe(onSuccess: { [weak self] users in
      guard let `self` = self else { return }
      self.users.append(contentsOf: users)
      self.users.removeDuplicates()
      self.users = self.localStorage.removeDeletedUsers(from: self.users)
      self.delegate?.didLoad(users: self.users)
    }) { [weak self] error in
      self?.delegate?.didFailLoadingUsers(error: error)
    }.disposed(by: bag)
  }
  
  func delete(user: User) {
    users = users.filter { $0.uuid != user.uuid }
    localStorage.deleteUser(with: user.uuid)
    delegate?.didDeleteUser(users: users)
  }
}
