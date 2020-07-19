import Foundation

// MARK: - UserApiResponse
struct UserApiResponse: Codable {
  let gender: String?
  let name: NameApiResponse?
  let location: LocationApiResponse?
  let email: String?
  let login: LoginApiResponse?
  let birthInfo: BirthdateInfoApiResponse?
  let registrationInfo: RegistrationDateInfoApiResponse?
  let phone, cellphone: String?
  let id: IDApiResponse?
  let picture: PictureApiResponse?
  let nationality: String?
  
  enum CodingKeys: String, CodingKey {
    case gender, name, location, email, login, phone, id, picture
    case birthInfo = "dob"
    case registrationInfo = "registered"
    case cellphone = "cell"
    case nationality = "nat"
  }
}

// MARK: - BirthdateInfoApiResponse
struct BirthdateInfoApiResponse: Codable {
  let date: String?
  let age: Int?
}

// MARK: - RegistrationDateInfoApiResponse
struct RegistrationDateInfoApiResponse: Codable {
  let date: String?
  let age: Int?
}

// MARK: - IDApiResponse
struct IDApiResponse: Codable {
  let name, value: String?
}

// MARK: - LocationApiResponse
struct LocationApiResponse: Codable {
  let street: StreetApiResponse?
  let city, state, country: String?
  let postcode: Int?
  let coordinates: CoordinatesApiResponse?
  let timezone: TimezoneApiResponse?
}

// MARK: - CoordinatesApiResponse
struct CoordinatesApiResponse: Codable {
  let latitude, longitude: String?
}

// MARK: - StreetApiResponse
struct StreetApiResponse: Codable {
  let number: Int?
  let name: String?
}

// MARK: - TimezoneApiResponse
struct TimezoneApiResponse: Codable {
  let offset, timezoneDescription: String?
  
  enum CodingKeys: String, CodingKey {
    case offset
    case timezoneDescription = "description"
  }
}

// MARK: - LoginApiResponse
struct LoginApiResponse: Codable {
  let uuid, username, password, salt: String?
  let md5, sha1, sha256: String?
}

// MARK: - NameApiResponse
struct NameApiResponse: Codable {
  let title, first, last: String?
}

// MARK: - PictureApiResponse
struct PictureApiResponse: Codable {
  let large, medium, thumbnail: String?
}
