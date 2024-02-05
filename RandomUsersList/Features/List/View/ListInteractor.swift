import UIKit
import RxSwift

// sourcery: AutoMockable
protocol ListInteractorDelegate: AnyObject {
   func didLoad(users: [UserDataModel])
   func didLoadSearched(users: [UserDataModel])
   func didFailLoadingUsers(error: Error)
   func didDeleteUser(users: [UserDataModel])
}

// sourcery: AutoMockable
protocol ListInteracting {
   var delegate: ListInteractorDelegate? { get set }
   var users: [UserDataModel] { get set }
   
   func fetchUsers()
   func delete(user: UserDataModel)
   func searchUsers(by text: String)
   func resetPagination()
}

class ListInteractor: ListInteracting {
   private enum Constants {
      static let numberOfResults = 10
   }
   
   weak var delegate: ListInteractorDelegate?
   private let getRandomUsers: GetRandomUsers.UseCase
   private let localStorage: LocalStorage
   var users: [UserDataModel] = []
   private var pagination: Int = 0
   private let bag = DisposeBag()
   
   init(getRandomUsers: @escaping GetRandomUsers.UseCase,
        localStorage: LocalStorage) {
      self.getRandomUsers = getRandomUsers
      self.localStorage = localStorage
   }
   
   func fetchUsers() {
      let request = RandomUsersRequest(results: Constants.numberOfResults,
                                       page: pagination)
      if self.pagination == 0 {
         self.localStorage.resetUsersDatabase()
      }
      self.pagination += 1
      getRandomUsers(request)
         .subscribe(onSuccess: { [weak self] users in
            guard let `self` = self else { return }
            let retrievedUsers = self.localStorage.retrieveSavedUsers()
            self.users = retrievedUsers
            self.users.append(contentsOf: users)
            self.users.removeDuplicates()
            self.users = self.localStorage.removeDeletedUsers(from: self.users)
            self.localStorage.save(users: self.users)
            self.delegate?.didLoad(users: self.users)
         }) { [weak self] error in
            self?.delegate?.didFailLoadingUsers(error: error)
         }.disposed(by: bag)
   }
   
   func delete(user: UserDataModel) {
      users = users.filter { $0.uuid != user.uuid }
      localStorage.deleteUser(with: user.uuid)
      delegate?.didDeleteUser(users: users)
   }
   
   func searchUsers(by text: String) {
      guard text == "" else {
         var filteredUsers = self.users
         filteredUsers = filteredUsers.filter({
            guard let fullname = $0.fullName?.lowercased(), let email = $0.email?.lowercased() else { return false }
            return fullname.contains(text.lowercased()) || email.contains(text.lowercased())
         })
         self.delegate?.didLoadSearched(users: filteredUsers)
         return
      }
      self.delegate?.didLoadSearched(users: self.users)
   }
   
   func resetPagination() {
      pagination = 0
   }
}
