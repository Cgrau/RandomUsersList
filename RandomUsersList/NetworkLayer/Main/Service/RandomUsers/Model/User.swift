import Foundation

// MARK: - User
struct User: Codable, Hashable {
  let uuid: String
  let fullName, email, gender, phone: String?
  let picture: Picture?
  let location: Location?
  let registeredDate: String?
  
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.uuid == rhs.uuid
  }
}

// MARK: - Picture
struct Picture: Codable, Hashable {
  let large, medium, thumbnail: String?
}

// MARK: - Location
struct Location: Codable, Hashable {
  let street, city, state: String?
}
