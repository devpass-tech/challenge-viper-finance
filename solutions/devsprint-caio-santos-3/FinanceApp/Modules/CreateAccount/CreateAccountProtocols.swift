// MARK: - ViewController
protocol CreateAccountPresenterOutputProtocol: AnyObject {
    func createAccountFailed(message: String)
}

// MARK: - Presenter
protocol CreateAccountPresenterInputProtocol: AnyObject {
    func viewDidAppear()
    func createAccount(email: String, password: String)
    func getEmail() -> String
    func getPassword() -> String
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

// MARK: - Transporter

struct CreateAccountTransporter {
    let email: String
    let password: String
    
    internal init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
