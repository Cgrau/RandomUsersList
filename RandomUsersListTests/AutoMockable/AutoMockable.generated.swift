// Generated using Sourcery 0.18.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import RandomUsersList
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class ListInteractorMock: NSObject, ListInteractor {
    var delegate: ListInteractorDelegate?

    //MARK: - fetchSomething

    private(set) var fetchSomethingCallsCount = 0
    var fetchSomethingCalled: Bool {
        return fetchSomethingCallsCount > 0
    }
    var fetchSomethingClosure: (() -> Void)?

    func fetchSomething() {
        fetchSomethingCallsCount += 1
        fetchSomethingClosure?()
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

}
class ListUIMock: NSObject, ListUI {

    //MARK: - showSomething

    private(set) var showSomethingCallsCount = 0
    var showSomethingCalled: Bool {
        return showSomethingCallsCount > 0
    }
    var showSomethingClosure: (() -> Void)?

    func showSomething() {
        showSomethingCallsCount += 1
        showSomethingClosure?()
    }

}
