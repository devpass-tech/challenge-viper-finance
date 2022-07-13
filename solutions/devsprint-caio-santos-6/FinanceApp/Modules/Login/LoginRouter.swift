import UIKit

final class LoginRouter {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension LoginRouter: LoginRouterProtocol {
    func showCreateAccountView() {
        
    }
    
    func showHomeView() {
        
    }
}
