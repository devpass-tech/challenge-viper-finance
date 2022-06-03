//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
    var presenter: ContactListPresenterProtocol?
    private(set) var contactList: [ContactEntity] = []
    
    private(set) lazy var contactListView: ContactListView = {
        return ContactListView(tableViewDataSource: self, tableViewDelegate: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = self.contactListView
    }
}

// MARK: UITableViewDataSource
extension ContactListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.cellIdentifier, for: indexPath) as? ContactCellView else {
            return UITableViewCell()
        }
        
        cell.setupContactCell(contact: contactList[indexPath.row])

        return cell
    }
}

// MARK: UITableViewDelegate
extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        tableView.reloadData()
    }
}

// MARK: ContactListPresenterDelegate
extension ContactListViewController: ContactListPresenterDelegate {
    func showData(contactList: [ContactEntity]) {
        self.contactList = contactList
    }
}
