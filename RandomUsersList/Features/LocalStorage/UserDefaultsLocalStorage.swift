import Foundation

final class UserDefaultsLocalStorage: LocalStorage {
  
  private let userDefaults: UserDefaults
  
  init(userDefaults: UserDefaults) {
    self.userDefaults = userDefaults
  }
  
  func deleteUser(with uuid: String) {
    var deletedUsers = userDefaults.array(forKey: LocalStorageKey.deletedUsers.rawValue) as? [String] ?? []
    deletedUsers.append(uuid)
    userDefaults.set(deletedUsers, forKey: LocalStorageKey.deletedUsers.rawValue)
  }
  
  func removeDeletedUsers(from: [User]) -> [User] {
    var filteredArray = from
    let deletedUsers = userDefaults.array(forKey: LocalStorageKey.deletedUsers.rawValue) as? [String] ?? []
    filteredArray.removeAll(where: { deletedUsers.contains($0.uuid) })
    return filteredArray
  }
}
