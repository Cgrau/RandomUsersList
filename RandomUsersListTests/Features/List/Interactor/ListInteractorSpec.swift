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
    givenRetrievedUsers()
    sut.fetchUsers()
    XCTAssertTrue(localStorage.retrieveSavedUsersCalled)
    XCTAssertTrue(localStorage.removeDeletedUsersFromCalled)
    XCTAssertTrue(localStorage.saveUsersCalled)
    XCTAssertTrue(delegate.didLoadUsersCalled)
    XCTAssertFalse(delegate.didFailLoadingUsersErrorCalled)
  }
  
  func test_fetchUsers_KO() {
    givenGetRandomUsersResponse_KO()
    sut.fetchUsers()
    XCTAssertFalse(localStorage.retrieveSavedUsersCalled)
    XCTAssertFalse(localStorage.removeDeletedUsersFromCalled)
    XCTAssertFalse(localStorage.saveUsersCalled)
    XCTAssertFalse(delegate.didLoadUsersCalled)
    XCTAssertTrue(delegate.didFailLoadingUsersErrorCalled)
  }
  
  func test_deleteUser() {
    sut.delete(user: UserDataModel.mock)
    XCTAssertTrue(localStorage.deleteUserWithCalled)
    XCTAssertTrue(delegate.didDeleteUserUsersCalled)
  }
  
  func test_searchUserByText() {
    givenUsers()
    sut.searchUsers(by: "John")
    XCTAssertTrue(delegate.didLoadUsersCalled)
    XCTAssertEqual(delegate.didLoadUsersCallsCount, 1)
  }
  
  func test_searchUserByText_empty() {
    sut.searchUsers(by: "")
    XCTAssertTrue(delegate.didLoadUsersCalled)
    XCTAssertEqual(delegate.didLoadUsersCallsCount, 1)
  }
}

extension ListInteractorSpec {
  func givenGetRandomUsersResponse_OK() {
    getRandomUsersUseCase.executeRequestReturnValue = Single.create(subscribe: { event in
      event(.success([UserDataModel](repeating: UserDataModel.mock, count: 10)))
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
    sut.users = [UserDataModel](repeating: UserDataModel.mock, count: 10)
  }
  
  func givenRetrievedUsers() {
    localStorage.retrieveSavedUsersReturnValue = [UserDataModel.mock, UserDataModel.mockRandom]
  }
}
