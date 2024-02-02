import XCTest
@testable import RandomUsersList

final class ListPresenterSpec: XCTestCase {
  
  private var sut: DefaultListPresenter!
  private var ui: ListUIMock!
  private var interactor: ListInteractorMock!
  private var navigator: ListNavigatorMock!
  
  override func setUp() {
    interactor = ListInteractorMock()
    navigator = ListNavigatorMock()
    ui = ListUIMock()
    sut = DefaultListPresenter(interactor: interactor,
                               navigator: navigator)
    sut.ui = ui
  }
  
  override func tearDown() {
    interactor = nil
    navigator = nil
    ui = nil
    sut = nil
  }
  
  func test_did_load() {
    sut.didLoad()
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.fetchUsersCalled)
  }
  
  func test_select_user() {
    sut.didSelect(user: UserDataModel.mock)
    XCTAssertTrue(navigator.navigateToDetailUserCalled)
  }
  
  func test_delete_user() {
    sut.delete(user: UserDataModel.mock)
    XCTAssertTrue(interactor.deleteUserCalled)
  }
  
  func test_searchForText() {
    sut.search(for: "Text")
    XCTAssertTrue(interactor.searchUsersByCalled)
  }
  
  func test_loadMoreUsers() {
    sut.loadMoreUsers()
    XCTAssertTrue(ui.showLoadingCalled)
    XCTAssertTrue(interactor.fetchUsersCalled)
  }
  
  // MARK:- ListInteractorDelegate
  func test_didLoadUsers() {
    sut.didLoad(users: [UserDataModel](repeating: UserDataModel.mock, count: 40))
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showUsersCalled)
  }
  
  func test_didFailLoadingUsers() {
    sut.didFailLoadingUsers(error: DefaultError.mock)
    XCTAssertTrue(ui.hideLoadingCalled)
    XCTAssertTrue(ui.showErrorCalled)
  }
  
  func test_didDeleteUser() {
    sut.didDeleteUser(users: [UserDataModel](repeating: UserDataModel.mock, count: 39))
    XCTAssertTrue(ui.showUsersCalled)
  }
}
