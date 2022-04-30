import Foundation
import UIKit

public final class LoginConfigurator {
        
    public func createModule() -> UIViewController {
        let router = LoginRouter()
        let network = NetworkClient()
        let interactor = LoginInteractor(network: network)
        let presenter = LoginPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = LoginViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
