// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
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














class GetRandomUsersUseCaseMock: NSObject, GetRandomUsersUseCase {

    //MARK: - execute

    private(set) var executeRequestCallsCount = 0
    var executeRequestCalled: Bool {
        return executeRequestCallsCount > 0
    }
    private(set) var executeRequestReceivedRequest: RandomUsersRequest?
    private(set) var executeRequestReceivedInvocations: [RandomUsersRequest] = []
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

}
class ListNavigatorMock: NSObject, ListNavigator {

    //MARK: - navigate

    private(set) var navigateCallsCount = 0
    var navigateCalled: Bool {
        return navigateCallsCount > 0
    }
    var navigateClosure: (() -> Void)?

    func navigate() {
        navigateCallsCount += 1
        navigateClosure?()
    }

}
class ListPresenterMock: NSObject, ListPresenter {
    var ui: ListUI?

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

    //MARK: - didSelect

    private(set) var didSelectUserCallsCount = 0
    var didSelectUserCalled: Bool {
        return didSelectUserCallsCount > 0
    }
    private(set) var didSelectUserReceivedUser: User?
    private(set) var didSelectUserReceivedInvocations: [User] = []
    var didSelectUserClosure: ((User) -> Void)?

    func didSelect(user: User) {
        didSelectUserCallsCount += 1
        didSelectUserReceivedUser = user
        didSelectUserReceivedInvocations.append(user)
        didSelectUserClosure?(user)
    }

}
class ListUIMock: NSObject, ListUI {

    //MARK: - show

    private(set) var showUsersCallsCount = 0
    var showUsersCalled: Bool {
        return showUsersCallsCount > 0
    }
    private(set) var showUsersReceivedUsers: [User]?
    private(set) var showUsersReceivedInvocations: [[User]] = []
    var showUsersClosure: (([User]) -> Void)?

    func show(users: [User]) {
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
    private(set) var showErrorReceivedInvocations: [String] = []
    var showErrorClosure: ((String) -> Void)?

    func show(error: String) {
        showErrorCallsCount += 1
        showErrorReceivedError = error
        showErrorReceivedInvocations.append(error)
        showErrorClosure?(error)
    }

}
