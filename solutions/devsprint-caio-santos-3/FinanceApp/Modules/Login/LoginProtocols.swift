// MARK: - ViewController
protocol LoginPresenterOutputProtocol: AnyObject {
    func authenticationFailed(message: String)
}

// MARK: - Presenter
protocol LoginPresenterInputProtocol: AnyObject {
    func viewDidAppear()
    func authenticate(email: String, password: String)
    func showCreateAccountView()
}

// MARK: - Interactor
protocol LoginInteractorInputProtocol: AnyObject {
    func validateData(email: String, password: String) -> (isvalid: Bool, message: String)
    func authenticate(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject {
    func authenticationSuccessful()
    func authenticationFailed()
}

// MARK: - Router
protocol LoginRouterProtocol: AnyObject {
    func showCreateAccountView()
    func showHomeView()
}
