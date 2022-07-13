import Foundation

final class LoginPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: LoginPresenterOutputProtocol?
    private let router: LoginRouterProtocol
    private let interactor: LoginInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: LoginRouterProtocol,
        interactor: LoginInteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension LoginPresenter: LoginPresenterInputProtocol {
    func authenticate(email: String, password: String) {
        interactor.authenticate(email: email, password: password)
    }
    
    func showCreateAccountView() {
        router.showCreateAccountView()
    }
}

// MARK: - Output Protocol
extension LoginPresenter: LoginInteractorOutputProtocol {
    func authenticationSuccessful() {
        router.showHomeView()
    }
    
    func authenticationFailed() {
        viewController?.authenticationFailed(message: "Usuário e senha inválido!")
    }
}
