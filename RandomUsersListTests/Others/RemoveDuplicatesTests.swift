import XCTest
@testable import RandomUsersList

final class RemoveDuplicatedTests: XCTestCase {
  private var array = [User]()
  
  func test_1_element_from_ArrayOfSameElement() {
    givenArrayOfSameElement()
    array.removeDuplicates()
    XCTAssertEqual(array.count, 1)
  }
  
  func test_2same_1different() {
    givenArrayOf2same1different()
    array.removeDuplicates()
    XCTAssertEqual(array.count, 2)
  }
  
  func givenArrayOfSameElement() {
    array = [User](repeating: User.mock, count: 40)
  }
  
  func givenArrayOf2same1different() {
    array = [User.mock, User.mock, User.mockRandom]
  }
}
