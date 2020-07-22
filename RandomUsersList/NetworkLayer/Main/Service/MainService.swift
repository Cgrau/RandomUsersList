import Moya

enum MainService: TargetType {
  case randomUsers(RandomUsersRequest)
}

extension MainService {
  var baseURL: URL {
    return Service.baseUrl
  }
  
  var path: String {
    return endpoint(for: self).path
  }
  
  var method: Moya.Method {
    return endpoint(for: self).method
  }
  
  var task: Task {
    return endpoint(for: self).task
  }
}

private func endpoint(for service: MainService) -> Endpoint {
  switch service {
  case .randomUsers(let request):
    return RandomUsersEndpoint(request: request)
  }
}
