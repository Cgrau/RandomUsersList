import XCTest
@testable import RandomUsersList

final class RemoveDuplicatedTests: XCTestCase {
  private var array = [UserDataModel]()
  
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
    array = [UserDataModel](repeating: UserDataModel.mock, count: 40)
  }
  
  func givenArrayOf2same1different() {
    array = [UserDataModel.mock, UserDataModel.mock, UserDataModel.mockRandom]
  }
}
