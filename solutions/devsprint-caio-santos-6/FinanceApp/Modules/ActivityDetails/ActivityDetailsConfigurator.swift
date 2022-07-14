import UIKit

public protocol ActivityDetailsConfiguratorProtocol: AnyObject {
    func createModule() -> UIViewController
}

public final class ActivityDetailsConfigurator: ActivityDetailsConfiguratorProtocol {
    public init() {}

    public func createModule() -> UIViewController {
        let router = ActivityDetailsRouter()
        let interactor = ActivityDetailsInteractor(network: FinanceService())
        let presenter = ActivityDetailsPresenter(router: router, interactor: interactor)
        
        interactor.output = presenter
        let viewController = ActivityDetailsViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
