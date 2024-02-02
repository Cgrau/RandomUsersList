import UIKit

protocol ListInteractor: AnyObject, AutoMockable {
   var delegate: ListInteractorDelegate? { get set }
   var users: [UserDataModel] { get set }
   
   func fetchUsers()
   func delete(user: UserDataModel)
   func searchUsers(by text: String)
   func resetPagination()
}
