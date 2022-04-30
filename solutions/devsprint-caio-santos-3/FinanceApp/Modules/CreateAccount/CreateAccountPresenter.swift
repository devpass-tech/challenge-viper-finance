import Foundation

final class CreateAccountPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: CreateAccountPresenterOutputProtocol?
    private let router: CreateAccountRouterProtocol
    private let interactor: CreateAccountInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: CreateAccountRouterProtocol,
        interactor: CreateAccountInteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    private func validateData(email: String, password: String) -> (isvalid: Bool, message: String) {
        guard email.isValidEmail() else {
            return (false, "Email não está em um formato válido")
        }
                    
        guard password.isValidPassword() else {
            return (false, "Senha não está em um formato válido")
        }
        
        return (true, "")
    }
}

// MARK: - Input Protocol
extension CreateAccountPresenter: CreateAccountPresenterInputProtocol {
    func viewDidAppear() {
        trackScreenView()
    }
    
    func createAccount(email: String, password: String) {
        let validation = validateData(email: email, password: password)
        
        if validation.isvalid {
            interactor.createAccount(email: email, password: password)
        } else {
            viewController?.createAccountFailed(message: validation.message)
        }
    }
}

// MARK: - Output Protocol
extension CreateAccountPresenter: CreateAccountInteractorOutputProtocol {
    func createAccountSuccessful() {
        router.showHomeView()
    }
    
    func createAccountFailed() {
        viewController?.createAccountFailed(message: "Ocorreu um erro ao tentar cadastrar o novo usuário.")
    }
}

// MARK: - Analytics
extension CreateAccountPresenter {
    func trackScreenView() {
        
    }
}
