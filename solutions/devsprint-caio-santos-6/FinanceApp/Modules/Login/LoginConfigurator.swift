import UIKit

public protocol LoginConfiguratorProtocol: AnyObject {
    func createModule() -> UIViewController
}

public final class LoginConfigurator: LoginConfiguratorProtocol {
    public init() {}

    public func createModule() -> UIViewController {
        let router = LoginRouter()
        let interactor = LoginInteractor(service: FinanceService())
        let presenter = LoginPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = LoginViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
