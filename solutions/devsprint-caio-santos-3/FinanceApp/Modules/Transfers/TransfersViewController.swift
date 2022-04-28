//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol TransfersControlling where Self: UIViewController {
}

class TransfersViewController: UIViewController,
                               TransfersControlling {
    
    private var presenter: TransfersPresenting?
    
    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
    
    init(presenter: TransfersPresenting) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransfersViewController: TransferViewDelegate {
    func didPressChooseContactButton() {
        presenter?.chooseNavigateToContactList()
    }
    
    func didPressTransferButton() {
        presenter?.chooseTransferMoney()
    }
}
