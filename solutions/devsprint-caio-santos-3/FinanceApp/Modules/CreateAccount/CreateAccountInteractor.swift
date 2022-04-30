import Foundation

final class CreateAccountInteractor {
    
    // MARK: - VIPER Properties

    weak var output: CreateAccountInteractorOutputProtocol?

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
extension CreateAccountInteractor: CreateAccountInteractorInputProtocol {
    func createAccount(email: String, password: String) {
        // TODO: Implement network layer here
        
        if email.lowercased() == "teste@teste.com" {
            output?.createAccountFailed()
        } else {
            output?.createAccountSuccessful()
        }
    }
}
