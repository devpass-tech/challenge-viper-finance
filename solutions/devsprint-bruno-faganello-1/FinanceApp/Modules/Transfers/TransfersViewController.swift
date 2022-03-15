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
        presenter?.didPressChooseContactButton()

        let navigationController = UINavigationController(rootViewController: ContactListViewController())
        self.present(navigationController, animated: true)
    }

    func didPressTransferButton() {
        presenter?.didPressTransferButton()

        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        self.present(navigationController, animated: true)
    }
}

extension TransfersViewController: TransferPresenterDelegate {
    func showData() {
        print("Here is your data, View!")

    }
}
