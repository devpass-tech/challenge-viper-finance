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
//    func callService()
//    func getData()
//    func fetchObject()
    func tappedNice()
}

protocol ConfirmationInteractorOutputProtocol: AnyObject {
//    func didLoadData(data: Any?)
//    func didFinishSuccessfull()
//    func didLoadDataWithError()
    func niceButtonResponse()
    func sample1()
    func sample2()
    func sample3()
}

extension ConfirmationInteractorOutputProtocol {
    func sample1() {}
    func sample2() {}
    func sample3() {}
}

// MARK: - Router
protocol ConfirmationRouterProtocol: AnyObject {
}
