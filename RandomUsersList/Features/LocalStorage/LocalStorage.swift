// sourcery: AutoMockable
protocol LocalStorage {
   func deleteUser(with uuid: String)
   func removeDeletedUsers(from: [UserDataModel]) -> [UserDataModel]
   func save(users: [UserDataModel])
   func retrieveSavedUsers() -> [UserDataModel]
   func resetUsersDatabase()
}
