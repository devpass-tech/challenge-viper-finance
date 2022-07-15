import UIKit

public final class ConfirmationConfigurator {
        
    public func createModule() -> UIViewController {
        let router = ConfirmationRouter()
        let interactor = ConfirmationInteractor()
        let presenter = ConfirmationPresenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ConfirmationViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
