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
        let validation = interactor.validateData(email: email, password: password)
        
        if validation.isvalid {
            interactor.authenticate(email: email, password: password)
        } else {
            viewController?.authenticationFailed(message: validation.message)
        }
    }
    
    func showCreateAccountView(email: String, password: String) {
        router.showCreateAccountView(email: email, password: password)
    }
    
    func viewDidAppear() {
        trackScreenView()
    }
}

// MARK: - Output Protocol
extension LoginPresenter: LoginInteractorOutputProtocol {
    func authenticationSuccessful() {
        router.showHomeView()
    }
    
    func authenticationFailed() {
        // TODO: Implement 3 attempts by email logic
        
        viewController?.authenticationFailed(message: "Usuário e/ou senha inválidos. Tente novamente.")
    }
}

// MARK: - Analytics
extension LoginPresenter {
    func trackScreenView() {
    }
}
