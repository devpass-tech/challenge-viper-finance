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
    weak var presenter: ContactListInteractorOutput?

}

extension ContactListInteractor: ContactListInteractorInput {
    func fetchContacts() {
        contacts = Contact.stub
        presenter?.didFetchContacts(contacts)
    }
}
