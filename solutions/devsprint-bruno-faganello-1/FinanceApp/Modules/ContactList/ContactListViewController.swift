//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

// MARK: - ContactListViewController

final class ContactListViewController: UIViewController {

    // MARK: Public Properties
    
    var presenter: ContactListPresenterProtocol?
    
    override func loadView() {
        self.view = ContactListView()
    }
}

// MARK: - ContactListPresenterDelegate

extension ContactListViewController: ContactListPresenterDelegate {
    
}
