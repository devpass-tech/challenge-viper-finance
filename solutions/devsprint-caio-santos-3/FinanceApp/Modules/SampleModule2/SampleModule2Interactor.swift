final class SampleModule2Interactor {
    
    // MARK: - VIPER Properties

    weak var output: SampleModule2InteractorOutputProtocol?

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
extension SampleModule2Interactor: SampleModule2InteractorInputProtocol {

}
