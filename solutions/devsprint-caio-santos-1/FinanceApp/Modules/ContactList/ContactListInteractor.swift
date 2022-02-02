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
    
    func didFetchData()
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
    
    
}
