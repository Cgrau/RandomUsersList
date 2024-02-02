import RxSwift

struct GetRandomUsers {
   typealias UseCase = (RandomUsersRequest) -> Single<[UserDataModel]>
   
   private let repository: MainRepository
   
   init(repository: MainRepository) {
      self.repository = repository
   }
   
   func execute(_ request: RandomUsersRequest) -> Single<[UserDataModel]> {
      return repository.getRandomUsers(request: request)
   }
}
