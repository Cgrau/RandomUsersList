import Foundation

// MARK: - User
struct UserDataModel: Codable, Hashable {
  let uuid: String
  let fullName, email, phone: String?
  let gender: Gender?
  let picture: Picture?
  let location: Location?
  let registeredDate: String?
  
  static func == (lhs: UserDataModel, rhs: UserDataModel) -> Bool {
    return lhs.uuid == rhs.uuid
  }
}

// MARK: - Gender
enum Gender: String, Codable {
  case male
  case female
}

// MARK: - Picture
struct Picture: Codable, Hashable {
  let large, medium, thumbnail: String?
}

// MARK: - Location
struct Location: Codable, Hashable {
  let street, city, state: String?
}
