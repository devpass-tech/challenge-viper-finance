
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
        for _ in 1...3 {
            output?.niceButtonResponse()
        }
        
//        output?.sample3()
//        output?.sample1()
//        output?.sample2()
    }
}
