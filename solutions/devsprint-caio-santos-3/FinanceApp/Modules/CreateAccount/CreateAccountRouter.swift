import UIKit

final class CreateAccountRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension CreateAccountRouter: CreateAccountRouterProtocol {
    func showHomeView() {
        viewController?.navigationController?.setViewControllers([TabBarController()], animated: true)
    }
}
