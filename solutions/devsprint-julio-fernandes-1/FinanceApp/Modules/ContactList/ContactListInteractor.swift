//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 02/02/22.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData(contactList: [ContactEntity])
    func didReceiveError(error: Error)
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    private let service: FinanceServiceProtocol

    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .contactList) { [weak self] (result: Result<[ContactEntity], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                self.presenter?.didFetchData(contactList: list)
            case .failure(let error):
                self.presenter?.didReceiveError(error: error)
            }
        }
    }
}
