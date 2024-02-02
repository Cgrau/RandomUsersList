import XCTest
import RxBlocking
import OHHTTPStubs
@testable import RandomUsersList

class MainSpec: XCTestCase {
  
  private var sut: MainRepository!
  
  override func setUp() {
    super.setUp()
    sut = resolver.mainRepository
  }
  
  override func tearDown() {
    sut = nil
    HTTPStubs.removeAllStubs()
    super.tearDown()
  }
  
  func test_get_random_users() {
    givenTheseUsers()
    XCTAssertNoThrow(try sut.getRandomUsers(request: RandomUsersRequest.mock).toBlocking().single())
  }
}

extension MainSpec {
  private func givenTheseUsers() {
    stub(condition: pathMatches("/?results=.*")) { _ in
      return HTTPStubsResponse(jsonObject: Fixture.load("RandomUsers.ok"),
                                 statusCode: 200,
                                 headers: nil
      )
    }
  }
}

extension RandomUsersRequest {
  static var mock: RandomUsersRequest {
     return RandomUsersRequest(results: 10,
                               page: 0)
  }
}
