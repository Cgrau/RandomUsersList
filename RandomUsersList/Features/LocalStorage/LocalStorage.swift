protocol LocalStorage: AutoMockable {
  func deleteUser(with uuid: String)
  func removeDeletedUsers(from: [User]) -> [User]
}
