//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation

final class ContactListInteractor: ContactListInteractorProtocol {

    weak var presenter: ContactListInteractorDelegate?
    private let service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol){
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .contactList) { (response: Result<[ContactListEntity], FinanceServiceError>) in
            switch response {
            case .success(let list):
                self.presenter?.didFetchData(contactList: list)
            case .failure(let failure):
                break
            }
        }
    }
}
