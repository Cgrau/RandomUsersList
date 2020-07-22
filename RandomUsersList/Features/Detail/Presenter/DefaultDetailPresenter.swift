import UIKit

class DefaultDetailPresenter: DetailPresenter {
  
  weak var ui: DetailUI?
  private let user: User
  
  init(user: User) {
    self.user = user
  }
  
  func didLoad() {
    guard let fullname = user.fullName,
      let gender = user.gender?.rawValue,
      let street = user.location?.street,
      let city = user.location?.city,
      let state = user.location?.state,
      let registeredDate = user.registeredDate,
      let email = user.email,
      let picture = user.picture?.large else { return }
    ui?.show(userDetails: UserDetails(fullName: fullname,
                                      gender: gender,
                                      street: street,
                                      city: city,
                                      state: state,
                                      registeredDate: registeredDate,
                                      email: email,
                                      picture: picture))
  }
}
