@testable import ___VARIABLE_sdkName___

typealias ___VARIABLE_moduleName___PresenterInputProtocolDummy = ___VARIABLE_moduleName___PresenterInputProtocolSpy

final class ___VARIABLE_moduleName___PresenterInputProtocolSpy: ___VARIABLE_moduleName___PresenterInputProtocol {
    private(set) var viewDidAppearCalled = false
    func viewDidAppear() {
        viewDidAppearCalled = true
    }
}