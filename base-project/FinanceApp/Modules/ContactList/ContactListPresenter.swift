//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ContactListPresenterDelegate: AnyObject {

}

class ContactListPresenter: ContactListPresenterProtocol {

    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
}

extension ContactListPresenter: ContactListInteractorDelegate {

}
