
final class ActivityDetailsInteractor {
    
    // MARK: - VIPER Properties

    weak var output: ActivityDetailsInteractorOutputProtocol?

    // MARK: - Private Properties
    
    private let network: FinanceServiceProtocol

    // MARK: - Inits
    
    init(network: FinanceServiceProtocol) {
        self.network = network
    }

    // MARK: - Internal Methods
    
    // MARK: - Private Methods 
}

// MARK: - Input Protocol
extension ActivityDetailsInteractor: ActivityDetailsInteractorInputProtocol {
    func makeReport() {
        print("do any report logic")
        output?.sendReport()
    }
}
