extension NetworkAssembly {
   var getRandomUsers: GetRandomUsers.UseCase {
      return GetRandomUsers(repository: mainRepository).execute
   }
   
   var mainRepository: MainRepository {
      return MainRepository(apiDataSource: mainDataSource)
   }
   
   private var mainDataSource: MainDataSource {
      return MainApiDataSource(provider: moya(),
                               errorAdapter: errorAdapter,
                               mapper: RandomUsersApiToDomainMapper())
   }
}
