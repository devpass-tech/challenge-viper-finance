import Foundation

final class SampleModule2Presenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: SampleModule2PresenterOutputProtocol?
    private let router: SampleModule2RouterProtocol
    private let interactor: SampleModule2InteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: SampleModule2RouterProtocol,
        interactor: SampleModule2InteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension SampleModule2Presenter: SampleModule2PresenterInputProtocol {
    
}

// MARK: - Output Protocol
extension SampleModule2Presenter: SampleModule2InteractorOutputProtocol {
    
}
