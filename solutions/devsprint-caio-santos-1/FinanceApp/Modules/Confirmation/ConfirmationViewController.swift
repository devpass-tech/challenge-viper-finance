//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    
    var presenter: ConfirmationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = ConfirmationView()
    }
}

extension ConfirmationViewController: ConfirmationPresenterDelegate {
    
    func showData() {
        
        print("Here is your data, View!")
    }
}
