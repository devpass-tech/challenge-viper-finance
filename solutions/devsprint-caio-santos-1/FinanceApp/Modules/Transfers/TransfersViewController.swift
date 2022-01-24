//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class TransfersViewController: UIViewController {

    var presenter: TransfersPresenterProtocol?

    override func loadView() {
        self.view = TransfersView()
    }
}

extension TransfersViewController: TransfersPresenterDelegate {

}
