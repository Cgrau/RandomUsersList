import XCTest
import RxSwift
@testable import RandomUsersList

final class ListInteractorSpec: XCTestCase {
  
  private var sut: DefaultListInteractor!
  private var getRandomUsersUseCase: GetRandomUsersUseCaseMock!
  private var localStorage: LocalStorageMock!
  private var delegate: ListInteractorDelegateMock!
  
  override func setUp() {
    getRandomUsersUseCase = GetRandomUsersUseCaseMock()
    localStorage = LocalStorageMock()
    delegate = ListInteractorDelegateMock()
    sut = DefaultListInteractor(getRandomUsersUseCase: getRandomUsersUseCase,
                                localStorage: localStorage)
    sut.delegate = delegate
  }
  
  override func tearDown() {
    sut = nil
    getRandomUsersUseCase = nil
    delegate = nil
  }
  
  func test_fetchUsers_OK() {
    givenGetRandomUsersResponse_OK()
    givenDeletedUsers()
    sut.fetchUsers()
    XCTAssertTrue(localStorage.removeDeletedUsersFromCalled)
    XCTAssertTrue(delegate.didLoadUsersCalled)
    XCTAssertFalse(delegate.didFailLoadingUsersErrorCalled)
  }
  
  func test_fetchUsers_KO() {
    givenGetRandomUsersResponse_KO()
    sut.fetchUsers()
    XCTAssertFalse(localStorage.removeDeletedUsersFromCalled)
    XCTAssertFalse(delegate.didLoadUsersCalled)
    XCTAssertTrue(delegate.didFailLoadingUsersErrorCalled)
  }
  
  func test_deleteUser() {
    sut.delete(user: User.mock)
    XCTAssertTrue(localStorage.deleteUserWithCalled)
    XCTAssertTrue(delegate.didDeleteUserUsersCalled)
  }
  
  func test_searchUserByText() {
    givenUsers()
    sut.searchUsers(by: "John")
    XCTAssertTrue(delegate.didLoadUsersCalled)
  }
  
  func test_searchUserByText_empty() {
    sut.searchUsers(by: "")
    XCTAssertTrue(delegate.didLoadUsersCalled)
  }
}

extension ListInteractorSpec {
  func givenGetRandomUsersResponse_OK() {
    getRandomUsersUseCase.executeRequestReturnValue = Single.create(subscribe: { event in
      event(.success([User](repeating: User.mock, count: 10)))
      return Disposables.create()
    })
  }

  func givenGetRandomUsersResponse_KO() {
    getRandomUsersUseCase.executeRequestReturnValue = Single.create(subscribe: { event in
      event(.error(DefaultError.mock))
      return Disposables.create()
    })
  }
  
  func givenDeletedUsers() {
    localStorage.removeDeletedUsersFromReturnValue = []
  }
  
  func givenUsers() {
    sut.users = [User](repeating: User.mock, count: 10)
  }
}
