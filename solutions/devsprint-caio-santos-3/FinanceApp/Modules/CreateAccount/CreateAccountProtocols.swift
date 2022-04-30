// MARK: - ViewController
protocol CreateAccountPresenterOutputProtocol: AnyObject {
    func createAccountFailed(message: String)
}

// MARK: - Presenter
protocol CreateAccountPresenterInputProtocol: AnyObject {
    func viewDidAppear()
    func createAccount(email: String, password: String)
}

// MARK: - Interactor
protocol CreateAccountInteractorInputProtocol: AnyObject {
    func createAccount(email: String, password: String)
}

protocol CreateAccountInteractorOutputProtocol: AnyObject {
    func createAccountSuccessful()
    func createAccountFailed()
}

// MARK: - Router
protocol CreateAccountRouterProtocol: AnyObject {
    func showHomeView()
}
