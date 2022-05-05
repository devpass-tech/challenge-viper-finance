//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
    
    private lazy var contentView: ContactListView = {
        return ContactListView(tableViewDataSource: self,
                               tableViewDelegate: self)
    }()
    
    private var contactList: [ContactListEntity] = []
    var presenter: ContactListPresenterProtocol?
    
    init(presenter: ContactListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = self.contentView
    }
}

extension ContactListViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.cellIdentifier, for: indexPath) as? ContactCellView else {
            return UITableViewCell()
        }
        let contacts = contactList[indexPath.row]
        cell.setupLabels(contacts: contacts)
        return cell
    }
}

extension ContactListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}


extension ContactListViewController: ContactListPresenterDelegate {

    func showData(_ contactList: [ContactListEntity]) {
        self.contactList = contactList
    }
}
