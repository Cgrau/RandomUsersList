import XCTest
@testable import RandomUsersList

final class DetailPresenterSpec: XCTestCase {
   
   private var sut: DefaultDetailPresenter!
   private var ui: DetailUIMock!
   
   override func setUp() {
      ui = DetailUIMock()
      sut = DefaultDetailPresenter(user: UserDataModel.mock)
      sut.ui = ui
   }
   
   override func tearDown() {
      ui = nil
      sut = nil
   }
   
   func test_did_load() {
      sut.didLoad()
      XCTAssertTrue(ui._showUserDetails.called)
   }
}
