//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {
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
        guard let navigationController = self.navigationController else { return }
        presenter?.goToContactList(navigation: navigationController)
    }
    
    func didPressTransferButton() {
        guard let navigationController = self.navigationController else { return }
        presenter?.goToConfirmation(navigation: navigationController)
    }
}

extension TransfersViewController: TransfersPresenterDelegate {
    func showDataOnView() {
        print("show data on view")
    }
}
