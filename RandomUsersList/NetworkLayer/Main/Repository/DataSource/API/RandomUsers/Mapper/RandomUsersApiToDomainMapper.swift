import Foundation
import CoreLocation

struct RandomUsersApiToDomainMapper: Mappable {
  func map(data: Data?) -> [User]? {
    guard let data = data else {
      return nil
    }
    let jsonDecoder = JSONDecoder()
    do {
      return try decode(jsonDecoder: jsonDecoder, data: data)
    } catch  {
      return nil
    }
  }
  
  func map(_ from: RandomUsersApiResponse) throws -> [User] {
    let users = from.results.removingDuplicates()
    return users.map { (response: UserApiResponse) in
      return User(name: response.name?.first,
                  surname: response.name?.last,
                  email: response.email,
                  gender: response.gender,
                  phone: response.phone,
                  picture: map(picture: response.picture),
                  location: map(location: response.location),
                  registeredDate: map(registeredDate: response.registrationInfo?.date))
    }
  }
  
  private func map(picture: PictureApiResponse?) -> Picture? {
    guard let picture = picture else { return nil }
    return Picture(large: picture.large,
                   medium: picture.medium,
                   thumbnail: picture.thumbnail)
  }
  
  private func map(location: LocationApiResponse?) -> Location? {
    guard let location = location else { return nil }
    return Location(street: map(street: location.street),
                    city: location.city,
                    state: location.state)
  }
  
  private func map(street: StreetApiResponse?) -> String? {
    guard let street = street,
      let number = street.number,
      let name = street.name else { return nil }
    return "\(number) \(name)"
  }
  
  private func map(registeredDate: String?) -> String? {
    guard let registeredDate = registeredDate else { return nil }
    return registeredDate.formatDateString()
  }
  
  private func decode(jsonDecoder: JSONDecoder, data: Data) throws -> [User] {
    let response = try jsonDecoder.decode(RandomUsersApiResponse.self, from: data)
    return try map(response)
  }
}
