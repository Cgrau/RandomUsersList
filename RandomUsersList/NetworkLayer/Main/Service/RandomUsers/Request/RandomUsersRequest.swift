import Foundation

public struct RandomUsersRequest {
  public let results: Int
  
  public init(results: Int) {
    self.results = results
  }
}
