import SnapshotTesting
import XCTest
@testable import RandomUsersList

class ListViewSpec: XCTestCase {
  
  private var sut: ListView!
  
  override func setUp() {
    sut = listView()
  }
  
  func test_empty_list_view_state() {
    assertSnapshot(matching: sut, as: .image)
  }
  
  func test_list_view_filled_state() {
    givenUsers()
    assertSnapshot(matching: sut, as: .image)
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func givenUsers() {
    sut.users = [User](repeating: User.mock, count: 40)
  }
}

extension ListViewSpec {
  private func listView() -> ListView {
    return ListView(frame: viewControllerFrame)
  }
}
