import UIKit

public final class SampleModule2Configurator {
        
    public func createModule() -> UIViewController {
        let router = SampleModule2Router()
        let interactor = SampleModule2Interactor(network: NetworkClient())
        let presenter = SampleModule2Presenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = SampleModule2ViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
