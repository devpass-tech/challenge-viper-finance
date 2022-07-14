// MARK: - ViewController
protocol ConfirmationPresenterOutputProtocol: AnyObject {
    func dismissConfirmation()
}

// MARK: - Presenter
protocol ConfirmationPresenterInputProtocol: AnyObject {
    func viewDidAppear()
    func didTapNice()
}

// MARK: - Interactor
protocol ConfirmationInteractorInputProtocol: AnyObject {
    func tappedNice()
}

protocol ConfirmationInteractorOutputProtocol: AnyObject {
    func niceButtonResponse()
}

// MARK: - Router
protocol ConfirmationRouterProtocol: AnyObject {
}
