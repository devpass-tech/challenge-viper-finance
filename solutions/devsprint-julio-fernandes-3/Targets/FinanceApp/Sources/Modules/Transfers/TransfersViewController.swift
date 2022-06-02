//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
    var presenter: TransfersPresenterProtocol?
    private(set) var transferAmount: String = ""

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

// MARK: TransferViewDelegate
extension TransfersViewController: TransferViewDelegate {
    func setTransferAmount(value: String) {
        transferAmount = value
    }

    func didPressChooseContactButton() {
        presenter?.openContactList()
    }

    func didPressTransferButton() {
        presenter?.openTransferConfirmation()
    }
}

// MARK: TransfersPresenterDelegate
extension TransfersViewController: TransfersPresenterDelegate {
    func showData(transfer: TransfersEntity) {
        print("Show data")
    }
}
