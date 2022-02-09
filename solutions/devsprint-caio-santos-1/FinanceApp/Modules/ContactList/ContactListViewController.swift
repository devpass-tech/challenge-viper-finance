//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ContactListViewControllerProtocol{
    func getNameLabel(at index: Int) -> String
    func getPhoneLabel(at index: Int) -> String
    func numberOfRowsInSection() -> Int
}

final class ContactListViewController: UIViewController {
    var presenter: ContactListPresenterProtocol?
    var contactList: ContactListEntity?
    
    lazy var contactListView: ContactListView = {
        let contactListView = ContactListView(viewController: self)
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

extension ContactListViewController: ContactListViewControllerProtocol {
    func numberOfRowsInSection() -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func getNameLabel(at index: Int) -> String {
        return presenter?.getNameLabel(at: index) ?? ""
    }
    
    func getPhoneLabel(at index: Int) -> String {
        return presenter?.getNameLabel(at: index) ?? ""
    }
}
