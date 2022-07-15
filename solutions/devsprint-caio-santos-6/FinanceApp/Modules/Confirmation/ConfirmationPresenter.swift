import Foundation

final class ConfirmationPresenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: ConfirmationPresenterOutputProtocol?
    private let router: ConfirmationRouterProtocol
    private let interactor: ConfirmationInteractorInputProtocol
    
    // MARK: - Internal Properties

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: ConfirmationRouterProtocol,
        interactor: ConfirmationInteractorInputProtocol
    ) {
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension ConfirmationPresenter: ConfirmationPresenterInputProtocol {
    func viewDidAppear() {
        print("presenter called")
    }
    
    func didTapNice() {
        interactor.tappedNice()
    }
}

// MARK: - Output Protocol
extension ConfirmationPresenter: ConfirmationInteractorOutputProtocol {
    func niceButtonResponse() {
        viewController?.dismissConfirmation()
    }
}
