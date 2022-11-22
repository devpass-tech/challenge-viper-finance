//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {

    private let presenter: ContactListPresenterInput
    private lazy var contactListView = ContactListView()

    init(presenter: ContactListPresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = contactListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupTableViewProtocols(contactListView.tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension ContactListViewController: ContactListPresenterOutput {
    func updateUI() {
        DispatchQueue.main.async {
            self.contactListView.tableView.reloadData()
        }
    }
}
