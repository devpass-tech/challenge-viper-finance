import Foundation

final class LoginInteractor {
    
    // MARK: - VIPER Properties

    weak var output: LoginInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let network: NetworkClientProtocol

    // MARK: - Inits
    
    init(network: NetworkClientProtocol) {
        self.network = network
    }


    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension LoginInteractor: LoginInteractorInputProtocol {
    func validateData(email: String, password: String) -> (isvalid: Bool, message: String) {
        guard email.isValidEmail() else {
            return (false, "Email não está em um formato válido")
        }
                    
        guard password.isValidPassword() else {
            return (false, "Senha não está em um formato válido")
        }
        
        return (true, "")
    }
    
    func authenticate(email: String, password: String) {
        // TODO: Implement network layer here
        
        if email.lowercased() == "teste@teste.com" && password == "1111" {
            output?.authenticationSuccessful()
        } else {
            output?.authenticationFailed()
        }
    }
}
