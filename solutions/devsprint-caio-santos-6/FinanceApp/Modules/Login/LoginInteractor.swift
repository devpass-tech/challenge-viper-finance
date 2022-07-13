
final class LoginInteractor {
    
    // MARK: - VIPER Properties

    weak var output: LoginInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let service: FinanceServiceProtocol

    // MARK: - Inits
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension LoginInteractor: LoginInteractorInputProtocol {
    func authenticate(email: String, password: String) {
        output?.authenticationFailed()
    }
}
