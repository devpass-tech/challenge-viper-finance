
final class ConfirmationInteractor {
    
    // MARK: - VIPER Properties

    weak var output: ConfirmationInteractorOutputProtocol?

    // MARK: - Private Properties
    
    // MARK: - Inits

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension ConfirmationInteractor: ConfirmationInteractorInputProtocol {
    func tappedNice() {
        output?.niceButtonResponse()
    }
}
