import Foundation

public struct RandomUsersRequest {
   public let results: Int
   public let page: Int
   
   public init(results: Int,
               page: Int) {
      self.results = results
      self.page = page
   }
}
