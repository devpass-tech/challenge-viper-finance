import UIKit

final class LoginRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension LoginRouter: LoginRouterProtocol {
    func showCreateAccountView(email: String, password: String) {
        let createAccountViewController = CreateAccountConfigurator(transporter: .init(email: email,
                                                                                       password: password)).createModule()
        viewController?.navigationController?.pushViewController(createAccountViewController, animated: true)
    }

    func showHomeView() {
        viewController?.navigationController?.setViewControllers([TabBarController()], animated: true)
    }
}
