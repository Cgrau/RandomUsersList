extension NetworkAssembly {
  var getRandomUsers: GetRandomUsersUseCase {
    return GetRandomUsers(repository: mainRepository)
  }
  
  private var mainRepository: MainRepository {
    return MainRepository(apiDataSource: mainDataSource)
  }
  
  private var mainDataSource: MainDataSource {
    return MainApiDataSource(provider: moya(),
                             errorAdapter: errorAdapter,
                             mapper: RandomUsersApiToDomainMapper())
  }
}
