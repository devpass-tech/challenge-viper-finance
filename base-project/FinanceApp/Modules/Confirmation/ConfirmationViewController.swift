//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

    var presenter: ConfirmationPresenterProtocol?

    override func loadView() {
        self.view = ConfirmationView()
    }
}

extension ConfirmationViewController: ConfirmationPresenterDelegate {

}
