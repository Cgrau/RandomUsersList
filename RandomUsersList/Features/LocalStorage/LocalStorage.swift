protocol LocalStorage: AutoMockable {
  func deleteUser(with uuid: String)
  func removeDeletedUsers(from: [User]) -> [User]
  func save(users: [User])
  func retrieveSavedUsers() -> [User]
}
