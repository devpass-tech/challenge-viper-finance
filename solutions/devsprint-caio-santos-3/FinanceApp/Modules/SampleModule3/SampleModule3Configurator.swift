import UIKit

public final class SampleModule3Configurator {
    
    let transporter: ObjetoTransporter
    
    init(transporter: ObjetoTransporter) {
        self.transporter = transporter
    }
        
    public func createModule() -> UIViewController {
        let router = SampleModule3Router()
        let interactor = SampleModule3Interactor(network: NetworkClient())
        let presenter = SampleModule3Presenter(router: router, interactor: interactor, transporter: transporter)
        interactor.output = presenter
        let viewController = SampleModule3ViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}


public struct ObjetoTransporter {
    // General data
    let data: String
    let name: String
    
    internal init(data: String, name: String) {
        self.data = data
        self.name = name
    }
}
