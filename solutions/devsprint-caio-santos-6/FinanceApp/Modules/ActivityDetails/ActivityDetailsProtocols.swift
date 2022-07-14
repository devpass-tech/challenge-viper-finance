// MARK: - ViewController
protocol ActivityDetailsPresenterOutputProtocol: AnyObject {
    func showReportAlert()
}

// MARK: - Presenter
protocol ActivityDetailsPresenterInputProtocol: AnyObject {
    func didTapReport()
}

// MARK: - Interactor
protocol ActivityDetailsInteractorInputProtocol: AnyObject {
    func makeReport()
}

protocol ActivityDetailsInteractorOutputProtocol: AnyObject {
    func sendReport()
}

// MARK: - Router
protocol ActivityDetailsRouterProtocol: AnyObject {
}
