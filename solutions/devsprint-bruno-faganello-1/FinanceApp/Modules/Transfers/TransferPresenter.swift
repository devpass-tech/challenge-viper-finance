import Foundation

protocol TransferPresenterDelegate: AnyObject {

    func showData()
}

class TransferPresenter: TransferPresenterProtocol {
    
    func didPressChooseContactButton() {}
    func didPressTransferButton() {}
    

    weak var view: TransferPresenterDelegate?
    var interactor: TransferInteractorProtocol?
    var router: TransferRouterProtocol?

}

extension TransferPresenter: TransferInteractorDelegate {

    func didFetchData() {

        view?.showData()
    }
}
