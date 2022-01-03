//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {

}

class ContactListInteractor: ContactListInteractorProtocol {

    weak var presenter: ContactListInteractorDelegate?

}
