import SnapshotTesting
import XCTest
@testable import RandomUsersList

class DetailViewSpec: XCTestCase {
   
   private var sut: DetailView!
   
   override func setUp() {
      sut = detailView()
   }
   
   func test_details_view_filled_state() {
      givenUserDetails()
      assertSnapshot(matching: sut, as: .image)
   }
   
   override func tearDown() {
      sut = nil
   }
   
   func givenUserDetails() {
      sut.userDetails = UserDetails.mock
   }
}

extension DetailViewSpec {
   private func detailView() -> DetailView {
      return DetailView(frame: viewControllerFrame)
   }
}
