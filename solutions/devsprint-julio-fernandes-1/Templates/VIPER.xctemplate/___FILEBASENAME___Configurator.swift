//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

public final class ___VARIABLE_moduleName___Configurator {
        
    public func createModule() -> UIViewController {
        let router = ___VARIABLE_moduleName___Router()
        let interactor = ___VARIABLE_moduleName___Interactor()
        let presenter = ___VARIABLE_moduleName___Presenter(router: router, interactor: interactor)
        interactor.output = presenter
        let viewController = ___VARIABLE_moduleName___ViewController(presenter: presenter)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
