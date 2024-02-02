// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

@testable import RandomUsersList
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import RxSwift
#elseif os(OSX)
import AppKit
#endif


// MARK: - DetailUI

class DetailUIMock: DetailUI {

    //MARK: - show

    struct ShowUserDetails {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUserDetails: UserDetails?
    }

    var showUserDetailsClosure: ((UserDetails) -> Void)?

    var _showUserDetails = ShowUserDetails()

    func show(userDetails: UserDetails) {
        _showUserDetails.callsCount += 1
        _showUserDetails.receivedUserDetails = userDetails
        showUserDetailsClosure?(userDetails)
    }
}
// MARK: - ListInteracting

class ListInteractingMock: ListInteracting {
    var delegate: ListInteractorDelegate?
    var users: [UserDataModel] = []

    //MARK: - fetchUsers

    struct FetchUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var fetchUsersClosure: (() -> Void)?

    var _fetchUsers = FetchUsers()

    func fetchUsers() {
        _fetchUsers.callsCount += 1
        fetchUsersClosure?()
    }

    //MARK: - delete

    struct DeleteUser {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUser: UserDataModel?
    }

    var deleteUserClosure: ((UserDataModel) -> Void)?

    var _deleteUser = DeleteUser()

    func delete(user: UserDataModel) {
        _deleteUser.callsCount += 1
        _deleteUser.receivedUser = user
        deleteUserClosure?(user)
    }

    //MARK: - searchUsers

    struct SearchUsersBy {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedText: String?
    }

    var searchUsersByClosure: ((String) -> Void)?

    var _searchUsersBy = SearchUsersBy()

    func searchUsers(by text: String) {
        _searchUsersBy.callsCount += 1
        _searchUsersBy.receivedText = text
        searchUsersByClosure?(text)
    }

    //MARK: - resetPagination

    struct ResetPagination {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var resetPaginationClosure: (() -> Void)?

    var _resetPagination = ResetPagination()

    func resetPagination() {
        _resetPagination.callsCount += 1
        resetPaginationClosure?()
    }
}
// MARK: - ListInteractorDelegate

class ListInteractorDelegateMock: ListInteractorDelegate {

    //MARK: - didLoad

    struct DidLoadUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUsers: [UserDataModel]?
    }

    var didLoadUsersClosure: (([UserDataModel]) -> Void)?

    var _didLoadUsers = DidLoadUsers()

    func didLoad(users: [UserDataModel]) {
        _didLoadUsers.callsCount += 1
        _didLoadUsers.receivedUsers = users
        didLoadUsersClosure?(users)
    }

    //MARK: - didLoadSearched

    struct DidLoadSearchedUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUsers: [UserDataModel]?
    }

    var didLoadSearchedUsersClosure: (([UserDataModel]) -> Void)?

    var _didLoadSearchedUsers = DidLoadSearchedUsers()

    func didLoadSearched(users: [UserDataModel]) {
        _didLoadSearchedUsers.callsCount += 1
        _didLoadSearchedUsers.receivedUsers = users
        didLoadSearchedUsersClosure?(users)
    }

    //MARK: - didFailLoadingUsers

    struct DidFailLoadingUsersError {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedError: Error?
    }

    var didFailLoadingUsersErrorClosure: ((Error) -> Void)?

    var _didFailLoadingUsersError = DidFailLoadingUsersError()

    func didFailLoadingUsers(error: Error) {
        _didFailLoadingUsersError.callsCount += 1
        _didFailLoadingUsersError.receivedError = error
        didFailLoadingUsersErrorClosure?(error)
    }

    //MARK: - didDeleteUser

    struct DidDeleteUserUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUsers: [UserDataModel]?
    }

    var didDeleteUserUsersClosure: (([UserDataModel]) -> Void)?

    var _didDeleteUserUsers = DidDeleteUserUsers()

    func didDeleteUser(users: [UserDataModel]) {
        _didDeleteUserUsers.callsCount += 1
        _didDeleteUserUsers.receivedUsers = users
        didDeleteUserUsersClosure?(users)
    }
}
// MARK: - ListNavigating

class ListNavigatingMock: ListNavigating {

    //MARK: - navigateToDetail

    struct NavigateToDetailUser {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUser: UserDataModel?
    }

    var navigateToDetailUserClosure: ((UserDataModel) -> Void)?

    var _navigateToDetailUser = NavigateToDetailUser()

    func navigateToDetail(user: UserDataModel) {
        _navigateToDetailUser.callsCount += 1
        _navigateToDetailUser.receivedUser = user
        navigateToDetailUserClosure?(user)
    }
}
// MARK: - ListPresenting

class ListPresentingMock: ListPresenting {
    var ui: ListUI?
    var users: [UserDataModel] = []

    //MARK: - didLoad

    struct DidLoad {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var didLoadClosure: (() -> Void)?

    var _didLoad = DidLoad()

    func didLoad() {
        _didLoad.callsCount += 1
        didLoadClosure?()
    }

    //MARK: - didSelectUser

    struct DidSelectUserWith {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedIndexPath: IndexPath?
    }

    var didSelectUserWithClosure: ((IndexPath) -> Void)?

    var _didSelectUserWith = DidSelectUserWith()

    func didSelectUser(with indexPath: IndexPath) {
        _didSelectUserWith.callsCount += 1
        _didSelectUserWith.receivedIndexPath = indexPath
        didSelectUserWithClosure?(indexPath)
    }

    //MARK: - didSelectDeleteUser

    struct DidSelectDeleteUserWith {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedIndexPath: IndexPath?
    }

    var didSelectDeleteUserWithClosure: ((IndexPath) -> Void)?

    var _didSelectDeleteUserWith = DidSelectDeleteUserWith()

    func didSelectDeleteUser(with indexPath: IndexPath) {
        _didSelectDeleteUserWith.callsCount += 1
        _didSelectDeleteUserWith.receivedIndexPath = indexPath
        didSelectDeleteUserWithClosure?(indexPath)
    }

    //MARK: - search

    struct SearchFor {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedText: String?
    }

    var searchForClosure: ((String) -> Void)?

    var _searchFor = SearchFor()

    func search(for text: String) {
        _searchFor.callsCount += 1
        _searchFor.receivedText = text
        searchForClosure?(text)
    }

    //MARK: - didScrollToBottom

    struct DidScrollToBottom {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var didScrollToBottomClosure: (() -> Void)?

    var _didScrollToBottom = DidScrollToBottom()

    func didScrollToBottom() {
        _didScrollToBottom.callsCount += 1
        didScrollToBottomClosure?()
    }

    //MARK: - didFocusSearch

    struct DidFocusSearch {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var didFocusSearchClosure: (() -> Void)?

    var _didFocusSearch = DidFocusSearch()

    func didFocusSearch() {
        _didFocusSearch.callsCount += 1
        didFocusSearchClosure?()
    }

    //MARK: - didUnfocusSearch

    struct DidUnfocusSearch {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var didUnfocusSearchClosure: (() -> Void)?

    var _didUnfocusSearch = DidUnfocusSearch()

    func didUnfocusSearch() {
        _didUnfocusSearch.callsCount += 1
        didUnfocusSearchClosure?()
    }
}
// MARK: - ListRowCellControlling

class ListRowCellControllingMock: ListRowCellControlling {

    //MARK: - tableView

    struct TableViewCellForItemAtViewModel {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedArguments: (tableView: UITableView, indexPath: IndexPath, viewModel: UserCellViewModel)?
      var returnValue: UITableViewCell!
    }

    var tableViewCellForItemAtViewModelClosure: ((UITableView, IndexPath, UserCellViewModel) -> UITableViewCell)?

    var _tableViewCellForItemAtViewModel = TableViewCellForItemAtViewModel()

    func tableView(_ tableView: UITableView, cellForItemAt indexPath: IndexPath, viewModel: UserCellViewModel) -> UITableViewCell {
        _tableViewCellForItemAtViewModel.callsCount += 1
        _tableViewCellForItemAtViewModel.receivedArguments = (tableView: tableView, indexPath: indexPath, viewModel: viewModel)
        return tableViewCellForItemAtViewModelClosure.map({ $0(tableView, indexPath, viewModel) }) ?? _tableViewCellForItemAtViewModel.returnValue
    }

    //MARK: - registerCell

    struct RegisterCellOn {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedTableView: UITableView?
    }

    var registerCellOnClosure: ((UITableView) -> Void)?

    var _registerCellOn = RegisterCellOn()

    func registerCell(on tableView: UITableView) {
        _registerCellOn.callsCount += 1
        _registerCellOn.receivedTableView = tableView
        registerCellOnClosure?(tableView)
    }
}
// MARK: - ListTableViewAdapterDelegate

class ListTableViewAdapterDelegateMock: ListTableViewAdapterDelegate {

    //MARK: - didSelectRow

    struct DidSelectRowAt {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedIndexPath: IndexPath?
    }

    var didSelectRowAtClosure: ((IndexPath) -> Void)?

    var _didSelectRowAt = DidSelectRowAt()

    func didSelectRow(at indexPath: IndexPath) {
        _didSelectRowAt.callsCount += 1
        _didSelectRowAt.receivedIndexPath = indexPath
        didSelectRowAtClosure?(indexPath)
    }

    //MARK: - didDeleteRow

    struct DidDeleteRowAt {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedIndexPath: IndexPath?
    }

    var didDeleteRowAtClosure: ((IndexPath) -> Void)?

    var _didDeleteRowAt = DidDeleteRowAt()

    func didDeleteRow(at indexPath: IndexPath) {
        _didDeleteRowAt.callsCount += 1
        _didDeleteRowAt.receivedIndexPath = indexPath
        didDeleteRowAtClosure?(indexPath)
    }

    //MARK: - didScrollToBottom

    struct DidScrollToBottom {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var didScrollToBottomClosure: (() -> Void)?

    var _didScrollToBottom = DidScrollToBottom()

    func didScrollToBottom() {
        _didScrollToBottom.callsCount += 1
        didScrollToBottomClosure?()
    }
}
// MARK: - ListUI

class ListUIMock: ListUI {

    //MARK: - apply

    struct ApplyViewModel {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedViewModel: ListViewModel?
    }

    var applyViewModelClosure: ((ListViewModel) -> Void)?

    var _applyViewModel = ApplyViewModel()

    func apply(viewModel: ListViewModel) {
        _applyViewModel.callsCount += 1
        _applyViewModel.receivedViewModel = viewModel
        applyViewModelClosure?(viewModel)
    }

    //MARK: - show

    struct ShowError {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedError: String?
    }

    var showErrorClosure: ((String) -> Void)?

    var _showError = ShowError()

    func show(error: String) {
        _showError.callsCount += 1
        _showError.receivedError = error
        showErrorClosure?(error)
    }

    //MARK: - showLoading

    struct ShowLoading {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var showLoadingClosure: (() -> Void)?

    var _showLoading = ShowLoading()

    func showLoading() {
        _showLoading.callsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    struct HideLoading {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var hideLoadingClosure: (() -> Void)?

    var _hideLoading = HideLoading()

    func hideLoading() {
        _hideLoading.callsCount += 1
        hideLoadingClosure?()
    }
}
// MARK: - ListViewModelMapping

class ListViewModelMappingMock: ListViewModelMapping {

    //MARK: - map

    struct MapData {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedData: [UserDataModel]?
      var returnValue: ListViewModel!
    }

    var mapDataClosure: (([UserDataModel]) -> ListViewModel)?

    var _mapData = MapData()

    func map(data: [UserDataModel]) -> ListViewModel {
        _mapData.callsCount += 1
        _mapData.receivedData = data
        return mapDataClosure.map({ $0(data) }) ?? _mapData.returnValue
    }
}
// MARK: - LocalStorage

class LocalStorageMock: LocalStorage {

    //MARK: - deleteUser

    struct DeleteUserWith {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUuid: String?
    }

    var deleteUserWithClosure: ((String) -> Void)?

    var _deleteUserWith = DeleteUserWith()

    func deleteUser(with uuid: String) {
        _deleteUserWith.callsCount += 1
        _deleteUserWith.receivedUuid = uuid
        deleteUserWithClosure?(uuid)
    }

    //MARK: - removeDeletedUsers

    struct RemoveDeletedUsersFrom {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedFrom: [UserDataModel]?
      var returnValue: [UserDataModel]!
    }

    var removeDeletedUsersFromClosure: (([UserDataModel]) -> [UserDataModel])?

    var _removeDeletedUsersFrom = RemoveDeletedUsersFrom()

    func removeDeletedUsers(from: [UserDataModel]) -> [UserDataModel] {
        _removeDeletedUsersFrom.callsCount += 1
        _removeDeletedUsersFrom.receivedFrom = from
        return removeDeletedUsersFromClosure.map({ $0(from) }) ?? _removeDeletedUsersFrom.returnValue
    }

    //MARK: - save

    struct SaveUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var receivedUsers: [UserDataModel]?
    }

    var saveUsersClosure: (([UserDataModel]) -> Void)?

    var _saveUsers = SaveUsers()

    func save(users: [UserDataModel]) {
        _saveUsers.callsCount += 1
        _saveUsers.receivedUsers = users
        saveUsersClosure?(users)
    }

    //MARK: - retrieveSavedUsers

    struct RetrieveSavedUsers {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
      var returnValue: [UserDataModel]!
    }

    var retrieveSavedUsersClosure: (() -> [UserDataModel])?

    var _retrieveSavedUsers = RetrieveSavedUsers()

    func retrieveSavedUsers() -> [UserDataModel] {
        _retrieveSavedUsers.callsCount += 1
        return retrieveSavedUsersClosure.map({ $0() }) ?? _retrieveSavedUsers.returnValue
    }

    //MARK: - resetUsersDatabase

    struct ResetUsersDatabase {
      var callsCount = 0
      var called: Bool { return callsCount > 0 }
    }

    var resetUsersDatabaseClosure: (() -> Void)?

    var _resetUsersDatabase = ResetUsersDatabase()

    func resetUsersDatabase() {
        _resetUsersDatabase.callsCount += 1
        resetUsersDatabaseClosure?()
    }
}
// swiftlint:enable all
