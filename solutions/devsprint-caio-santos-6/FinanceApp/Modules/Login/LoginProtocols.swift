// MARK: - ViewController
protocol LoginPresenterOutputProtocol: AnyObject { // -> Presenter manda para a ViewController
    func authenticationFailed(message: String)
}

// MARK: - Presenter
protocol LoginPresenterInputProtocol: AnyObject { // -> ViewController pede para a Presenter
    func authenticate(email: String, password: String)
    func showCreateAccountView()
}

// MARK: - Interactor
protocol LoginInteractorInputProtocol: AnyObject { // -> Presenter pede para a Interactor
    func authenticate(email: String, password: String)
}

protocol LoginInteractorOutputProtocol: AnyObject { // -> Interactor manda para a presenter
    func authenticationSuccessful()
    func authenticationFailed()
}

// MARK: - Router
protocol LoginRouterProtocol: AnyObject {
    func showCreateAccountView() // -> Quando toca no botão de criar conta
    func showHomeView()          // -> Quando autentica com sucesso
}
