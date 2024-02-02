import RxSwift
import Moya

struct MainApiDataSource: MainDataSource {
  
  private let provider: MoyaProvider<MainService>
  private let errorAdapter: ErrorAdapter
  private let mapper: RandomUsersApiToDomainMapper
  
  init(provider: MoyaProvider<MainService>,
       errorAdapter: ErrorAdapter,
       mapper: RandomUsersApiToDomainMapper) {
    self.provider = provider
    self.errorAdapter = errorAdapter
    self.mapper = mapper
  }
  
  func getRandomUsers(request: RandomUsersRequest) -> Single<[UserDataModel]> {
    return provider.rx
      .request(.randomUsers(request))
      .filterSuccessfulStatusCodes()
      .mapOrError(RandomUsersApiResponse.self, errorAdapter.make)
      .map(mapper.map)
  }
}
