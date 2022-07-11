//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    let screenView = ConfirmationView()
    
    override func loadView() {
        screenView.delegate = self
        view = screenView
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {
    func didTapButton() {
        dismiss(animated: true, completion: nil)
    }
}

