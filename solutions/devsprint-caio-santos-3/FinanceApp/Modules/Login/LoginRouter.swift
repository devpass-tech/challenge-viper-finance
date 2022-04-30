import UIKit

final class LoginRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension LoginRouter: LoginRouterProtocol {
    func showCreateAccountView() {
        let createAccountViewController = CreateAccountConfigurator().createModule()
        viewController?.navigationController?.pushViewController(createAccountViewController, animated: true)
    }

    func showHomeView() {
        viewController?.navigationController?.setViewControllers([TabBarController()], animated: true)
    }
}
