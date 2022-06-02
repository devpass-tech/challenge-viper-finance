//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 30/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class ContactListPresenter: ContactListPresenterProtocol {
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    
    var contactList: [ContactEntity] = []
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func numberOfRowsInSection() -> Int {
        return contactList.count
    }
    
    func getContactNameLabel(index: Int) -> String {
        return contactList[index].name
    }
    
    func getContactPhoneLabel(index: Int) -> String {
        return contactList[index].phone
    }
}

// MARK: ContactListInteractorDelegate
extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(contactList: [ContactEntity]) {
        self.contactList = contactList
    }
}
