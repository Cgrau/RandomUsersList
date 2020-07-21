import RxSwift

struct MainRepository {
  private let apiDataSource: MainDataSource
  
  init(apiDataSource: MainDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func getRandomUsers(request: RandomUsersRequest) -> Single<[User]> {
    apiDataSource.getRandomUsers(request: request)
  }
}
