import XCTest
import RxSwift
@testable import RandomUsersList

final class ListInteractorSpec: XCTestCase {
   
   private var sut: ListInteractor!
   private var getRandomUsers: GetRandomUsers.UseCase!
   private var localStorage: LocalStorageMock!
   private var delegate: ListInteractorDelegateMock!
   
   override func setUp() {
      getRandomUsers = { _ in .just([UserDataModel]()) }
      localStorage = LocalStorageMock()
      delegate = ListInteractorDelegateMock()
      sut = ListInteractor(getRandomUsers: getRandomUsers,
                           localStorage: localStorage)
      sut.delegate = delegate
   }
   
   override func tearDown() {
      sut = nil
      getRandomUsers = nil
      delegate = nil
   }
   
   func test_fetchUsers_OK() {
      givenSUT(getRandomUsersUseCase: givenGetRandomUsersResponse_OK())
      givenDeletedUsers()
      givenRetrievedUsers()
      sut.fetchUsers()
      XCTAssertTrue(localStorage._retrieveSavedUsers.called)
      XCTAssertTrue(localStorage._removeDeletedUsersFrom.called)
      XCTAssertTrue(localStorage._saveUsers.called)
      XCTAssertTrue(delegate._didLoadUsers.called)
      XCTAssertFalse(delegate._didFailLoadingUsersError.called)
   }
   
   func test_fetchUsers_KO() {
      givenSUT(getRandomUsersUseCase: givenGetRandomUsersResponse_KO())
      sut.fetchUsers()
      XCTAssertFalse(localStorage._retrieveSavedUsers.called)
      XCTAssertFalse(localStorage._removeDeletedUsersFrom.called)
      XCTAssertFalse(localStorage._saveUsers.called)
      XCTAssertFalse(delegate._didLoadUsers.called)
      XCTAssertTrue(delegate._didFailLoadingUsersError.called)
   }
   
   func test_deleteUser() {
      sut.delete(user: UserDataModel.mock)
      XCTAssertTrue(localStorage._deleteUserWith.called)
      XCTAssertTrue(delegate._didDeleteUserUsers.called)
   }
   
   func test_searchUserByText() {
      givenUsers()
      sut.searchUsers(by: "John")
      XCTAssertTrue(delegate._didLoadSearchedUsers.called)
      XCTAssertEqual(delegate._didLoadSearchedUsers.callsCount, 1)
   }
   
   func test_searchUserByText_empty() {
      sut.searchUsers(by: "")
      XCTAssertTrue(delegate._didLoadSearchedUsers.called)
      XCTAssertEqual(delegate._didLoadSearchedUsers.callsCount, 1)
   }
}

private extension ListInteractorSpec {
   func givenGetRandomUsersResponse_OK() -> GetRandomUsers.UseCase {
      { _ in
            .just([UserDataModel](repeating: UserDataModel.mock, count: 10))
      }
   }
   
   func givenGetRandomUsersResponse_KO() -> GetRandomUsers.UseCase {
      { _ in
            .error(DefaultError.mock)
      }
   }
   
   func givenDeletedUsers() {
      localStorage._removeDeletedUsersFrom.returnValue = []
   }
   
   func givenUsers() {
      sut.users = [UserDataModel](repeating: UserDataModel.mock, count: 10)
   }
   
   func givenRetrievedUsers() {
      localStorage._retrieveSavedUsers.returnValue = [UserDataModel.mock, UserDataModel.mockRandom]
   }
   
   func givenSUT(getRandomUsersUseCase: @escaping GetRandomUsers.UseCase = { _ in .just([]) }) {
      getRandomUsers = getRandomUsersUseCase
      localStorage = LocalStorageMock()
      delegate = ListInteractorDelegateMock()
      sut = ListInteractor(getRandomUsers: getRandomUsers,
                           localStorage: localStorage)
      sut.delegate = delegate
   }
}
