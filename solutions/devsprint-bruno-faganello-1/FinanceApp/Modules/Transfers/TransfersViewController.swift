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
        let contactsController = ContactListViewController()
        presenter?.didPressChooseContactButton(controller: contactsController)
    }

    func didPressTransferButton() {
        let confirmationViewController = ConfirmationViewController()
        presenter?.didPressTransferButton(controller: confirmationViewController)
    }
}

extension TransfersViewController: TransferPresenterDelegate {
    func showData() {
        print("Here is your data, View!")

    }
}
