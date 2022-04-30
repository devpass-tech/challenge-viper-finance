import Foundation
import UIKit

public final class CreateAccountConfigurator {
        
    public func createModule() -> UIViewController {
        let router = CreateAccountRouter()
        let network = NetworkClient()
        let interactor = CreateAccountInteractor(network: network)
        let presenter = CreateAccountPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = CreateAccountViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
