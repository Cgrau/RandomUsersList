import RxSwift

protocol GetRandomUsersUseCase: AutoMockable {
  func execute(request: RandomUsersRequest) -> Single<[User]>
}
