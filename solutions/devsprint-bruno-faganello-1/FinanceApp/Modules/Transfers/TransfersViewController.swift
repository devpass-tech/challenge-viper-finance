import UIKit

class TransfersViewController: UIViewController {
    
    var presenter: TransferPresenterProtocol?

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {

    func didPressChooseContactButton() {
        presenter?.didPressChooseContactButton(controller: self)
    }

    func didPressTransferButton() {
        presenter?.didPressTransferButton(controller: self)
    }
}

extension TransfersViewController: TransferPresenterDelegate {
    func showData() {
        print("Here is your data, View!")

    }
}
