//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import Foundation

protocol ContactListInteractorProtocol {
    var presenter: ContactListInteractorDelegate? { get set }
    func fetchData()
}

protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData(_ contactList: ContactListEntity)
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    
    func fetchData() {
        var list: ContactListEntity = []
        ContactListWorker(service: FinanceService()).fetchContactList(completion: { result in
            switch result {
            case .success(let contactList):
                list.append(contentsOf: contactList)
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        presenter?.didFetchData(list)
    }
    
    
}
