import Foundation

final class SampleModule3Interactor {
    
    // MARK: - VIPER Properties

    weak var output: SampleModule3InteractorOutputProtocol?

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
extension SampleModule3Interactor: SampleModule3InteractorInputProtocol {

}
