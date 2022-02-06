//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {

    var presenter: ContactListPresenterProtocol?
    var contactList: ContactListEntity?
    
    lazy var contactListView: ContactListView = {

        let contactListView = ContactListView()
        contactListView.delegate = self
        return contactListView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = contactListView
    }
}

extension ContactListViewController: ContactListPresenterDelegate {
    func showData(with contactList: ContactListEntity) {
        self.contactList = contactList
    }
}

extension ContactListViewController: ContactListViewDelegate {
    func didSelectContactButton() {
        print("didSelectContactButton tapped")
    }
}
