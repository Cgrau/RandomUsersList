@testable import RandomUsersList
import Foundation

extension UserDetails {
  static var mock: UserDetails {
    return UserDetails(fullName: "John Doe",
                       gender: "Male",
                       street: "14 Random Street",
                       city: "London",
                       state: "State",
                       registeredDate: "10:23 - 15-04-2020",
                       email: "email@email.com",
                       picture: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png")
  }
}
