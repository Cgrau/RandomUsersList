import XCTest
@testable import RandomUsersList

final class ListPresenterSpec: XCTestCase {
   
   private var sut: ListPresenter!
   private var ui: ListUIMock!
   private var interactor: ListInteractingMock!
   private var navigator: ListNavigatingMock!
   private var viewModelMapper: ListViewModelMappingMock!
   
   override func setUp() {
      interactor = ListInteractingMock()
      navigator = ListNavigatingMock()
      viewModelMapper = ListViewModelMappingMock()
      viewModelMapper._mapData.returnValue = ListViewModel.init(title: "LoremIpsum", placeholder: "LoremIpsum", users: [UserCellViewModel](repeating: UserCellViewModel.mock, count: 10))
      ui = ListUIMock()
      sut = ListPresenter(interactor: interactor,
                          navigator: navigator, 
                          viewModelMapper: viewModelMapper)
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
      XCTAssertTrue(ui._showLoading.called)
      XCTAssertTrue(interactor._fetchUsers.called)
   }
   
   func test_select_user() {
      sut.didLoad(users: [UserDataModel](repeating: UserDataModel.mock, count: 10))
      sut.didSelectUser(with: .init(row: 0, section: 0))
      XCTAssertTrue(navigator._navigateToDetailUser.called)
   }
   
   func test_delete_user() {
      sut.didLoad(users: [UserDataModel](repeating: UserDataModel.mock, count: 10))
      sut.didSelectDeleteUser(with: .init(row: 0, section: 0))
      XCTAssertTrue(interactor._deleteUser.called)
   }
   
   func test_searchForText() {
      sut.search(for: "Text")
      XCTAssertTrue(interactor._searchUsersBy.called)
   }
   
   func test_loadMoreUsers() {
      sut.didScrollToBottom()
      XCTAssertTrue(ui._showLoading.called)
      XCTAssertTrue(interactor._fetchUsers.called)
   }
   
   // MARK:- ListInteractorDelegate
   func test_didLoadUsers() {
      sut.didLoad(users: [UserDataModel](repeating: UserDataModel.mock, count: 10))
      XCTAssertTrue(ui._hideLoading.called)
      XCTAssertTrue(ui._applyViewModel.called)
   }
   
   func test_didFailLoadingUsers() {
      sut.didFailLoadingUsers(error: DefaultError.mock)
      XCTAssertTrue(ui._hideLoading.called)
      XCTAssertTrue(ui._showError.called)
   }
   
   func test_didDeleteUser() {
      sut.didDeleteUser(users: [UserDataModel](repeating: UserDataModel.mock, count: 9))
      XCTAssertTrue(ui._applyViewModel.called)
   }
}
