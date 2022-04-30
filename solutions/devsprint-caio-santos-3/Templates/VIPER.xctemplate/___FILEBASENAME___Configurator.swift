import AnalyticsCore
import NetworkCore
import UIKit

public final class ___VARIABLE_moduleName___Configurator {
        
    public func createModule() -> UIViewController {
        let router = ___VARIABLE_moduleName___Router()
        let network = NetworkRequestService()
        let interactor = ___VARIABLE_moduleName___Interactor(network: network)
        let eventTracker = ___VARIABLE_moduleName___EventTracker(analytics: <#AnalyticsCoreProtocol#>)
        let presenter = ___VARIABLE_moduleName___Presenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ___VARIABLE_moduleName___ViewController(
            presenter: presenter,
            eventTracker: eventTracker
        )
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
