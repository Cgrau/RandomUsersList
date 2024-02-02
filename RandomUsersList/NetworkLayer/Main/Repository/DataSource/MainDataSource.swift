import RxSwift

protocol MainDataSource {
  func getRandomUsers(request: RandomUsersRequest) -> Single<[UserDataModel]>
}
