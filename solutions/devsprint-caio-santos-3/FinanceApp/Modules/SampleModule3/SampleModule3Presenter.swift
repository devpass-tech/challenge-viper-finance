import Foundation

final class SampleModule3Presenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: SampleModule3PresenterOutputProtocol?
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    private let router: SampleModule3RouterProtocol
    private let interactor: SampleModule3InteractorInputProtocol
    private let transporter: ObjetoTransporter
    
    // MARK: - Inits
    
    init(
        router: SampleModule3RouterProtocol,
        interactor: SampleModule3InteractorInputProtocol,
        transporter: ObjetoTransporter
    ) {
        self.router = router
        self.interactor = interactor
        self.transporter = transporter
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension SampleModule3Presenter: SampleModule3PresenterInputProtocol {
    
}

// MARK: - Output Protocol
extension SampleModule3Presenter: SampleModule3InteractorOutputProtocol {
    
}
