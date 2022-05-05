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
        service.load(endpoint: .contactList) {[weak self] (response: Result<[ContactListEntity], FinanceServiceError>) in
            guard let self = self else { return }
            switch response {
            case let .success(list):
                self.presenter?.didFetchData(contactList: list)
            case let .failure(failure):
                self.presenter?.didErrorData(error: failure)
            }
        }
    }
}
