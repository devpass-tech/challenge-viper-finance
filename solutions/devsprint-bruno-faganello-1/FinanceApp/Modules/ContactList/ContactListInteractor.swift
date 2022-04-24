//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Victor Catão on 21/03/22.
//

import Foundation

// MARK: - ContactListInteractorDelegate

protocol ContactListInteractorDelegate: AnyObject {
    
}

// MARK: - ContactListInteractor

final class ContactListInteractor: ContactListInteractorProtocol {

    // MARK: Public Properties

    weak var presenter: ContactListInteractorDelegate?

    // MARK: Public Functions

    func fetchData() {
        // TODO
    }
}
