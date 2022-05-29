//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
    
    var presenter: TransfersPresenterProtocol?

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
        presenter?.openContactList()
    }

    func didPressTransferButton() {
        presenter?.openTransferConfirmation()
    }
}

extension TransfersViewController: TransfersPresenterDelegate {
    func showData() {
        print("Show data")
    }
}
