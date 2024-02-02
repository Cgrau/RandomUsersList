import RxSwift

struct MainRepository {
  private let apiDataSource: MainDataSource
  
  init(apiDataSource: MainDataSource) {
    self.apiDataSource = apiDataSource
  }
  
  func getRandomUsers(request: RandomUsersRequest) -> Single<[UserDataModel]> {
    apiDataSource.getRandomUsers(request: request)
  }
}
