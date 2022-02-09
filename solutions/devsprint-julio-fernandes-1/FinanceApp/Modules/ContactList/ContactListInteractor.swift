//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData(contactList: [ContactEntity])
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    private let provider: ContentProviderProtocol

    init(provider: ContentProviderProtocol) {
        self.provider = provider
    }

    func fetchData() {
        provider.load(jsonName: "contact_list_endpoint") { (result: Result<[ContactEntity], Error>) in
            switch result {
            case .success(let list):
                self.presenter?.didFetchData(contactList: list)
            case .failure(let error): break
            }
        }
    }
}
