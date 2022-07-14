import Foundation

final class ActivityDetailsPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: ActivityDetailsPresenterOutputProtocol?
    private let router: ActivityDetailsRouterProtocol
    private let interactor: ActivityDetailsInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: ActivityDetailsRouterProtocol,
        interactor: ActivityDetailsInteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension ActivityDetailsPresenter: ActivityDetailsPresenterInputProtocol {
    func didTapReport() {
        interactor.makeReport()
    }
}

// MARK: - Output Protocol
extension ActivityDetailsPresenter: ActivityDetailsInteractorOutputProtocol {
    func sendReport() {
        viewController?.showReportAlert()
    }
}
