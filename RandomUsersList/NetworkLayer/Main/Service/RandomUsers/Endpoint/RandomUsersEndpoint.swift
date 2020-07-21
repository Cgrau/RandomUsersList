import Moya
import Alamofire

struct RandomUsersEndpoint: Endpoint {
  private let request: RandomUsersRequest
  
  init(request: RandomUsersRequest) {
    self.request = request
  }
  
  var path: String {
    return ""
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var task: Task {
    return .requestParameters(parameters: ["results": request.results],
                              encoding: URLEncoding.default)
  }
}
