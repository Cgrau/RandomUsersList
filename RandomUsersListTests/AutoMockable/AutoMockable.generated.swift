// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import RandomUsersList
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import RxSwift
#elseif os(OSX)
import AppKit
#endif














class DetailUIMock: NSObject, DetailUI {

    //MARK: - show

    private(set) var showUserDetailsCallsCount = 0
    var showUserDetailsCalled: Bool {
        return showUserDetailsCallsCount > 0
    }
    private(set) var showUserDetailsReceivedUserDetails: UserDetails?
    private(set) var showUserDetailsReceivedInvocations: [] = []
    var showUserDetailsClosure: ((UserDetails) -> Void)?

    func show(userDetails: UserDetails) {
        showUserDetailsCallsCount += 1
        showUserDetailsReceivedUserDetails = userDetails
        showUserDetailsReceivedInvocations.append(userDetails)
        showUserDetailsClosure?(userDetails)
    }

}
class GetRandomUsersUseCaseMock: NSObject, GetRandomUsersUseCase {

    //MARK: - execute

    private(set) var executeRequestCallsCount = 0
    var executeRequestCalled: Bool {
        return executeRequestCallsCount > 0
    }
    private(set) var executeRequestReceivedRequest: RandomUsersRequest?
    private(set) var executeRequestReceivedInvocations: [] = []
    var executeRequestReturnValue: Single<[User]>!
    var executeRequestClosure: ((RandomUsersRequest) -> Single<[User]>)?

    func execute(request: RandomUsersRequest) -> Single<[User]> {
        executeRequestCallsCount += 1
        executeRequestReceivedRequest = request
        executeRequestReceivedInvocations.append(request)
        return executeRequestClosure.map({ $0(request) }) ?? executeRequestReturnValue
    }

}
class ListInteractorMock: NSObject, ListInteractor {
    var delegate: ListInteractorDelegate?
    var users: [User] = []

    //MARK: - fetchUsers

    private(set) var fetchUsersCallsCount = 0
    var fetchUsersCalled: Bool {
        return fetchUsersCallsCount > 0
    }
    var fetchUsersClosure: (() -> Void)?

    func fetchUsers() {
        fetchUsersCallsCount += 1
        fetchUsersClosure?()
    }

    //MARK: - delete

    private(set) var deleteUserCallsCount = 0
    var deleteUserCalled: Bool {
        return deleteUserCallsCount > 0
    }
    private(set) var deleteUserReceivedUser: User?
    private(set) var deleteUserReceivedInvocations: [] = []
    var deleteUserClosure: ((User) -> Void)?

    func delete(user: User) {
        deleteUserCallsCount += 1
        deleteUserReceivedUser = user
        deleteUserReceivedInvocations.append(user)
        deleteUserClosure?(user)
    }

    //MARK: - searchUsers

    private(set) var searchUsersByCallsCount = 0
    var searchUsersByCalled: Bool {
        return searchUsersByCallsCount > 0
    }
    private(set) var searchUsersByReceivedText: String?
    private(set) var searchUsersByReceivedInvocations: [] = []
    var searchUsersByClosure: ((String) -> Void)?

    func searchUsers(by text: String) {
        searchUsersByCallsCount += 1
        searchUsersByReceivedText = text
        searchUsersByReceivedInvocations.append(text)
        searchUsersByClosure?(text)
    }

}
class ListInteractorDelegateMock: NSObject, ListInteractorDelegate {

    //MARK: - didLoad

    private(set) var didLoadUsersCallsCount = 0
    var didLoadUsersCalled: Bool {
        return didLoadUsersCallsCount > 0
    }
    private(set) var didLoadUsersReceivedUsers: [User]?
    private(set) var didLoadUsersReceivedInvocations: [] = []
    var didLoadUsersClosure: (([User]) -> Void)?

    func didLoad(users: [User]) {
        didLoadUsersCallsCount += 1
        didLoadUsersReceivedUsers = users
        didLoadUsersReceivedInvocations.append(users)
        didLoadUsersClosure?(users)
    }

    //MARK: - didFailLoadingUsers

    private(set) var didFailLoadingUsersErrorCallsCount = 0
    var didFailLoadingUsersErrorCalled: Bool {
        return didFailLoadingUsersErrorCallsCount > 0
    }
    private(set) var didFailLoadingUsersErrorReceivedError: Error?
    private(set) var didFailLoadingUsersErrorReceivedInvocations: [] = []
    var didFailLoadingUsersErrorClosure: ((Error) -> Void)?

    func didFailLoadingUsers(error: Error) {
        didFailLoadingUsersErrorCallsCount += 1
        didFailLoadingUsersErrorReceivedError = error
        didFailLoadingUsersErrorReceivedInvocations.append(error)
        didFailLoadingUsersErrorClosure?(error)
    }

    //MARK: - didDeleteUser

    private(set) var didDeleteUserUsersCallsCount = 0
    var didDeleteUserUsersCalled: Bool {
        return didDeleteUserUsersCallsCount > 0
    }
    private(set) var didDeleteUserUsersReceivedUsers: [User]?
    private(set) var didDeleteUserUsersReceivedInvocations: [] = []
    var didDeleteUserUsersClosure: (([User]) -> Void)?

    func didDeleteUser(users: [User]) {
        didDeleteUserUsersCallsCount += 1
        didDeleteUserUsersReceivedUsers = users
        didDeleteUserUsersReceivedInvocations.append(users)
        didDeleteUserUsersClosure?(users)
    }

}
class ListNavigatorMock: NSObject, ListNavigator {

    //MARK: - navigateToDetail

    private(set) var navigateToDetailUserCallsCount = 0
    var navigateToDetailUserCalled: Bool {
        return navigateToDetailUserCallsCount > 0
    }
    private(set) var navigateToDetailUserReceivedUser: User?
    private(set) var navigateToDetailUserReceivedInvocations: [] = []
    var navigateToDetailUserClosure: ((User) -> Void)?

    func navigateToDetail(user: User) {
        navigateToDetailUserCallsCount += 1
        navigateToDetailUserReceivedUser = user
        navigateToDetailUserReceivedInvocations.append(user)
        navigateToDetailUserClosure?(user)
    }

}
class ListPresenterMock: NSObject, ListPresenter {
    var ui: ListUI?
    var users: [User] = []

    //MARK: - didLoad

    private(set) var didLoadCallsCount = 0
    var didLoadCalled: Bool {
        return didLoadCallsCount > 0
    }
    var didLoadClosure: (() -> Void)?

    func didLoad() {
        didLoadCallsCount += 1
        didLoadClosure?()
    }

    //MARK: - didSelectUser

    private(set) var didSelectUserWithCallsCount = 0
    var didSelectUserWithCalled: Bool {
        return didSelectUserWithCallsCount > 0
    }
    private(set) var didSelectUserWithReceivedIndexPath: IndexPath?
    private(set) var didSelectUserWithReceivedInvocations: [] = []
    var didSelectUserWithClosure: ((IndexPath) -> Void)?

    func didSelectUser(with indexPath: IndexPath) {
        didSelectUserWithCallsCount += 1
        didSelectUserWithReceivedIndexPath = indexPath
        didSelectUserWithReceivedInvocations.append(indexPath)
        didSelectUserWithClosure?(indexPath)
    }

    //MARK: - didSelectDeleteUser

    private(set) var didSelectDeleteUserWithCallsCount = 0
    var didSelectDeleteUserWithCalled: Bool {
        return didSelectDeleteUserWithCallsCount > 0
    }
    private(set) var didSelectDeleteUserWithReceivedIndexPath: IndexPath?
    private(set) var didSelectDeleteUserWithReceivedInvocations: [] = []
    var didSelectDeleteUserWithClosure: ((IndexPath) -> Void)?

    func didSelectDeleteUser(with indexPath: IndexPath) {
        didSelectDeleteUserWithCallsCount += 1
        didSelectDeleteUserWithReceivedIndexPath = indexPath
        didSelectDeleteUserWithReceivedInvocations.append(indexPath)
        didSelectDeleteUserWithClosure?(indexPath)
    }

    //MARK: - search

    private(set) var searchForCallsCount = 0
    var searchForCalled: Bool {
        return searchForCallsCount > 0
    }
    private(set) var searchForReceivedText: String?
    private(set) var searchForReceivedInvocations: [] = []
    var searchForClosure: ((String) -> Void)?

    func search(for text: String) {
        searchForCallsCount += 1
        searchForReceivedText = text
        searchForReceivedInvocations.append(text)
        searchForClosure?(text)
    }

    //MARK: - loadMoreUsers

    private(set) var loadMoreUsersCallsCount = 0
    var loadMoreUsersCalled: Bool {
        return loadMoreUsersCallsCount > 0
    }
    var loadMoreUsersClosure: (() -> Void)?

    func loadMoreUsers() {
        loadMoreUsersCallsCount += 1
        loadMoreUsersClosure?()
    }

}
class ListRowCellControllingMock: NSObject, ListRowCellControlling {

    //MARK: - tableView

    private(set) var tableViewCellForItemAtViewModelCallsCount = 0
    var tableViewCellForItemAtViewModelCalled: Bool {
        return tableViewCellForItemAtViewModelCallsCount > 0
    }
    private(set) var tableViewCellForItemAtViewModelReceivedArguments: (tableView: UITableView, indexPath: IndexPath, viewModel: UserCellViewModel)?
    private(set) var tableViewCellForItemAtViewModelReceivedInvocations: [(tableView: UITableView, indexPath: IndexPath, viewModel: UserCellViewModel)] = []
    var tableViewCellForItemAtViewModelReturnValue: UITableViewCell!
    var tableViewCellForItemAtViewModelClosure: ((UITableView, IndexPath, UserCellViewModel) -> UITableViewCell)?

    func tableView(_ tableView: UITableView, cellForItemAt indexPath: IndexPath, viewModel: UserCellViewModel) -> UITableViewCell {
        tableViewCellForItemAtViewModelCallsCount += 1
        tableViewCellForItemAtViewModelReceivedArguments = (tableView: tableView, indexPath: indexPath, viewModel: viewModel)
        tableViewCellForItemAtViewModelReceivedInvocations.append((tableView: tableView, indexPath: indexPath, viewModel: viewModel))
        return tableViewCellForItemAtViewModelClosure.map({ $0(tableView, indexPath, viewModel) }) ?? tableViewCellForItemAtViewModelReturnValue
    }

    //MARK: - registerCell

    private(set) var registerCellOnCallsCount = 0
    var registerCellOnCalled: Bool {
        return registerCellOnCallsCount > 0
    }
    private(set) var registerCellOnReceivedTableView: UITableView?
    private(set) var registerCellOnReceivedInvocations: [] = []
    var registerCellOnClosure: ((UITableView) -> Void)?

    func registerCell(on tableView: UITableView) {
        registerCellOnCallsCount += 1
        registerCellOnReceivedTableView = tableView
        registerCellOnReceivedInvocations.append(tableView)
        registerCellOnClosure?(tableView)
    }

}
class ListTableViewAdapterDelegateMock: NSObject, ListTableViewAdapterDelegate {

    //MARK: - didSelectRow

    private(set) var didSelectRowAtCallsCount = 0
    var didSelectRowAtCalled: Bool {
        return didSelectRowAtCallsCount > 0
    }
    private(set) var didSelectRowAtReceivedIndexPath: IndexPath?
    private(set) var didSelectRowAtReceivedInvocations: [] = []
    var didSelectRowAtClosure: ((IndexPath) -> Void)?

    func didSelectRow(at indexPath: IndexPath) {
        didSelectRowAtCallsCount += 1
        didSelectRowAtReceivedIndexPath = indexPath
        didSelectRowAtReceivedInvocations.append(indexPath)
        didSelectRowAtClosure?(indexPath)
    }

    //MARK: - didDeleteRow

    private(set) var didDeleteRowAtCallsCount = 0
    var didDeleteRowAtCalled: Bool {
        return didDeleteRowAtCallsCount > 0
    }
    private(set) var didDeleteRowAtReceivedIndexPath: IndexPath?
    private(set) var didDeleteRowAtReceivedInvocations: [] = []
    var didDeleteRowAtClosure: ((IndexPath) -> Void)?

    func didDeleteRow(at indexPath: IndexPath) {
        didDeleteRowAtCallsCount += 1
        didDeleteRowAtReceivedIndexPath = indexPath
        didDeleteRowAtReceivedInvocations.append(indexPath)
        didDeleteRowAtClosure?(indexPath)
    }

}
class ListUIMock: NSObject, ListUI {

    //MARK: - show

    private(set) var showUsersCallsCount = 0
    var showUsersCalled: Bool {
        return showUsersCallsCount > 0
    }
    private(set) var showUsersReceivedUsers: [UserCellViewModel]?
    private(set) var showUsersReceivedInvocations: [] = []
    var showUsersClosure: (([UserCellViewModel]) -> Void)?

    func show(users: [UserCellViewModel]) {
        showUsersCallsCount += 1
        showUsersReceivedUsers = users
        showUsersReceivedInvocations.append(users)
        showUsersClosure?(users)
    }

    //MARK: - show

    private(set) var showErrorCallsCount = 0
    var showErrorCalled: Bool {
        return showErrorCallsCount > 0
    }
    private(set) var showErrorReceivedError: String?
    private(set) var showErrorReceivedInvocations: [] = []
    var showErrorClosure: ((String) -> Void)?

    func show(error: String) {
        showErrorCallsCount += 1
        showErrorReceivedError = error
        showErrorReceivedInvocations.append(error)
        showErrorClosure?(error)
    }

    //MARK: - showLoading

    private(set) var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    private(set) var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

}
class LocalStorageMock: NSObject, LocalStorage {

    //MARK: - deleteUser

    private(set) var deleteUserWithCallsCount = 0
    var deleteUserWithCalled: Bool {
        return deleteUserWithCallsCount > 0
    }
    private(set) var deleteUserWithReceivedUuid: String?
    private(set) var deleteUserWithReceivedInvocations: [] = []
    var deleteUserWithClosure: ((String) -> Void)?

    func deleteUser(with uuid: String) {
        deleteUserWithCallsCount += 1
        deleteUserWithReceivedUuid = uuid
        deleteUserWithReceivedInvocations.append(uuid)
        deleteUserWithClosure?(uuid)
    }

    //MARK: - removeDeletedUsers

    private(set) var removeDeletedUsersFromCallsCount = 0
    var removeDeletedUsersFromCalled: Bool {
        return removeDeletedUsersFromCallsCount > 0
    }
    private(set) var removeDeletedUsersFromReceivedFrom: [User]?
    private(set) var removeDeletedUsersFromReceivedInvocations: [] = []
    var removeDeletedUsersFromReturnValue: [User]!
    var removeDeletedUsersFromClosure: (([User]) -> [User])?

    func removeDeletedUsers(from: [User]) -> [User] {
        removeDeletedUsersFromCallsCount += 1
        removeDeletedUsersFromReceivedFrom = from
        removeDeletedUsersFromReceivedInvocations.append(from)
        return removeDeletedUsersFromClosure.map({ $0(from) }) ?? removeDeletedUsersFromReturnValue
    }

    //MARK: - save

    private(set) var saveUsersCallsCount = 0
    var saveUsersCalled: Bool {
        return saveUsersCallsCount > 0
    }
    private(set) var saveUsersReceivedUsers: [User]?
    private(set) var saveUsersReceivedInvocations: [] = []
    var saveUsersClosure: (([User]) -> Void)?

    func save(users: [User]) {
        saveUsersCallsCount += 1
        saveUsersReceivedUsers = users
        saveUsersReceivedInvocations.append(users)
        saveUsersClosure?(users)
    }

    //MARK: - retrieveSavedUsers

    private(set) var retrieveSavedUsersCallsCount = 0
    var retrieveSavedUsersCalled: Bool {
        return retrieveSavedUsersCallsCount > 0
    }
    var retrieveSavedUsersReturnValue: [User]!
    var retrieveSavedUsersClosure: (() -> [User])?

    func retrieveSavedUsers() -> [User] {
        retrieveSavedUsersCallsCount += 1
        return retrieveSavedUsersClosure.map({ $0() }) ?? retrieveSavedUsersReturnValue
    }

}
