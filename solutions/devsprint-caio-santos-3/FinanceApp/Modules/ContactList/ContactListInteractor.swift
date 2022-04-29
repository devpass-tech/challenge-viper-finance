//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation

class ContactListInteractor: ContactListInteractorProtocol {

    weak var presenter: ContactListInteractorDelegate?

    func fetchData() {

        presenter?.didFetchData()
    }
}
