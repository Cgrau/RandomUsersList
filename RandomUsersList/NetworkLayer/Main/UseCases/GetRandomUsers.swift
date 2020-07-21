import RxSwift

struct GetRandomUsers: GetRandomUsersUseCase {

  private let repository: MainRepository
  
  init(repository: MainRepository) {
    self.repository = repository
  }
  
  func execute(request: RandomUsersRequest) -> Single<[User]> {
    return repository.getRandomUsers(request: request)
  }
}
