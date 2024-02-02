import Foundation

// sourcery: AutoMockable
protocol ListViewModelMapping {
   func map(data: [UserDataModel]) -> ListViewModel
}

final class ListViewModelMapper: ListViewModelMapping {
   private enum Constants {
      static let title = "RandomUsers"
      static let searchPlaceholder = "Search User"
   }
   
   func map(data: [UserDataModel]) -> ListViewModel {
      let mappedUsers = data.map {
         UserCellViewModel(fullName: $0.fullName,
                           email: $0.email,
                           phone: $0.phone,
                           imageURL: $0.picture?.thumbnail)
      }
      return .init(title: Constants.title,
                   placeholder: Constants.searchPlaceholder,
                   users: mappedUsers)
   }
}
