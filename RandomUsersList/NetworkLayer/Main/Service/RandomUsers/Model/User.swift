import Foundation

// MARK: - User
struct User: Codable, Equatable {
  let id: String?
  let fullName, email, gender, phone: String?
  let picture: Picture?
  let location: Location?
  let registeredDate: String?
  
  static func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id && lhs.fullName == rhs.fullName
  }
}

// MARK: - Picture
struct Picture: Codable {
  let large, medium, thumbnail: String?
}

// MARK: - Location
struct Location: Codable {
  let street, city, state: String?
}
