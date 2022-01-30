//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {

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

        let navigationController = UINavigationController(rootViewController: ContactListViewController())
        self.present(navigationController, animated: true)
    }

    func didPressTransferButton() {

        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        self.present(navigationController, animated: true)
    }
}
