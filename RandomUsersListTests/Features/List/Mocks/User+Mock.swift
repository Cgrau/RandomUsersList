@testable import RandomUsersList
import Foundation

extension User {
  static var mock: User {
    return User(uuid: "e1233-312312-1321312-13213213",
                fullName: "John Doe",
                email: "john.doe@random.com",
                phone: "5121321312",
                gender: Gender.male,
                picture: Picture(large: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png",
                                 medium: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png",
                                 thumbnail: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png"),
                location: Location(street: "",
                                   city: "",
                                   state: ""),
                registeredDate: "10:23 - 15-04-2020")
  }
  
  static var mockRandom: User {
    return User(uuid: "e1233-2323131-31312312222-111",
                fullName: "Rando Cardrissian",
                email: "rando.cardrissian@random.com",
                phone: "1331123",
                gender: Gender.male,
                picture: Picture(large: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png",
                                 medium: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png",
                                 thumbnail: "https://raw.githubusercontent.com/Cgrau/assets/master/RandomUsersList/blankThumbnail.png"),
                location: Location(street: "",
                                   city: "",
                                   state: ""),
                registeredDate: "12:13 - 15-12-2020")
  }
}
