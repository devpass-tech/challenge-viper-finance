//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 19/11/22.
//

import Foundation

protocol ContactListInteractorInput {
    func fetchContacts()
}

protocol ContactListInteractorOutput: AnyObject {
    func didFetchContacts(_ contacts: [Contact])
}

final class ContactListInteractor {

    private var contacts = [Contact]()
    private var service: FinanceServiceProtocol
    weak var presenter: ContactListInteractorOutput?

    init(service: FinanceService) {
        self.service = service
    }
}

extension ContactListInteractor: ContactListInteractorInput {
    func fetchContacts() {
        service.fetchContactList { [weak self] contacts in
            guard let self = self, let contacts = contacts else { return }
            self.contacts = contacts
            self.presenter?.didFetchContacts(contacts)
        }
    }
}
