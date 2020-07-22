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
  
  func save(users: [User]) {
    let usersJSON: [String?] = users.map {
      guard let jsonData = try? JSONEncoder().encode($0) else { return nil }
      let jsonString = String(data: jsonData, encoding: .utf8)!
      return jsonString
    }.compactMap {$0}
    userDefaults.set(usersJSON, forKey: LocalStorageKey.savedUsers.rawValue)
  }
  
  func retrieveSavedUsers() -> [User] {
    let jsonDataArray = userDefaults.array(forKey: LocalStorageKey.savedUsers.rawValue) as? [String] ?? []
    let users: [User?] = jsonDataArray.map {
      let jsonData = $0.data(using: .utf8)!
      guard let user = try? JSONDecoder().decode(User.self, from: jsonData) else { return nil }
      return user
    }
    return users.compactMap {$0}
  }
}
