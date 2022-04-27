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
    

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
//        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        self.view = transferView
    }
}
