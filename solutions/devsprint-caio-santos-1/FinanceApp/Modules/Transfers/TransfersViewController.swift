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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransfersPresenterDelegate {
    
    func showData() {
        
        print("Here is your data, Transfers View!")
    }
}

extension TransfersViewController: TransferViewDelegate {

    func didPressChooseContactButton() {
        guard let navigationController = self.navigationController else { return }
        presenter?.navigateToContactList(navigationController: navigationController)
    }

    func didPressTransferButton() {
        guard let navigationController = self.navigationController else { return }
        presenter?.navigateToConfirmation(navigationController: navigationController)
    }
}
