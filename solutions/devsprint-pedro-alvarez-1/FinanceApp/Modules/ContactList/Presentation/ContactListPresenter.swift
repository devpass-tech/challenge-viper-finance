//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 19/11/22.
//

import UIKit

protocol ContactListPresenterInput {
    func setupTableViewProtocols(_ tableView: UITableView)
    func viewWillAppear()
}

protocol ContactListPresenterOutput: AnyObject {
    func updateUI()
}

final class ContactListPresenter: NSObject {

    static let contactListViewCellSize = 82
    private let interactor: ContactListInteractorInput
    private let router: ContactListRouterProtocol
    weak var view: ContactListPresenterOutput?

    private var contacts: [ContactListViewModel] = [] {
        didSet {
            view?.updateUI()
        }
    }

    init(interactor: ContactListInteractorInput, router: ContactListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension ContactListPresenter: ContactListPresenterInput {
    func setupTableViewProtocols(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }

    func viewWillAppear() {
        interactor.fetchContacts()
    }
}

extension ContactListPresenter: ContactListInteractorOutput {
    func didFetchContacts(_ contacts: [Contact]) {
        self.contacts = contacts.map({ contact in
            ContactListViewModel(name: contact.name, phone: contact.phone)
        })
    }
}

extension ContactListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ContactCellView.self),
                                                       for: indexPath) as? ContactCellView else { return UITableViewCell()}

        cell.setupContent(with: contacts[indexPath.row])
        return cell
    }
}

extension ContactListPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ContactListPresenter.contactListViewCellSize)
    }
}
