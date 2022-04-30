import NetworkCore

final class ___VARIABLE_moduleName___Interactor {
    
    // MARK: - VIPER Properties

    weak var output: ___VARIABLE_moduleName___InteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let network: NetworkRequestable

    // MARK: - Inits
    
    init(network: NetworkRequestable) {
        self.network = network
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension ___VARIABLE_moduleName___Interactor: ___VARIABLE_moduleName___InteractorInputProtocol {

}
