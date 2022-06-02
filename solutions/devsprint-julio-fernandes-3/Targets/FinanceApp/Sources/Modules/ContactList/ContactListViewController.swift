//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ContactListViewControllerProtocol {
    func numberOfRowsInSection() -> Int
    func getContactNameLabel(index: Int) -> String
    func getcContactPhoneLabel(index: Int) -> String
}

class ContactListViewController: UIViewController {
    var presenter: ContactListPresenterProtocol?
    var contactList: [ContactEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func loadView() {
        let contactListView = ContactListView()
        contactListView.delegate = self
        self.view = contactListView
    }
}

// MARK: ContactListPresenterDelegate
extension ContactListViewController: ContactListPresenterDelegate {
    func showData(contactList: [ContactEntity]) {
        self.contactList = contactList
    }
}

// MARK: ContactListViewDelegate
extension ContactListViewController: ContactListViewDelegate {
    func didSelectContact() {
        print("didSelectContact tapped")
        self.dismiss(animated: true, completion: nil)
    }
}

extension ContactListViewController: ContactListViewControllerProtocol {
    func numberOfRowsInSection() -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func getContactNameLabel(index: Int) -> String {
        return presenter?.getContactNameLabel(index: index) ?? ""
    }
    
    func getcContactPhoneLabel(index: Int) -> String {
        return presenter?.getcContactPhoneLabel(index: index) ?? ""
    }
}
