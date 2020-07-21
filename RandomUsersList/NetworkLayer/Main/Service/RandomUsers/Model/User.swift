import Foundation

// MARK: - User
struct User: Codable {
  let name, surname, email, gender, phone: String?
  let picture: Picture?
  let location: Location?
  let registeredDate: String?
}

// MARK: - Picture
struct Picture: Codable {
  let large, medium, thumbnail: String?
}

// MARK: - Location
struct Location: Codable {
  let street, city, state: String?
}
