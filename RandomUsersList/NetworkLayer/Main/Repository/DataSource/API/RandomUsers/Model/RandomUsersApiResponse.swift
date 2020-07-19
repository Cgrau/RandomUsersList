import Foundation

// MARK: - RandomUsersApiResponse
struct RandomUsersApiResponse: Codable {
  let results: [UserApiResponse]
  let info: InfoApiResponse?
}

// MARK: - InfoApiResponse
struct InfoApiResponse: Codable {
  let seed: String?
  let results, page: Int?
  let version: String?
}
