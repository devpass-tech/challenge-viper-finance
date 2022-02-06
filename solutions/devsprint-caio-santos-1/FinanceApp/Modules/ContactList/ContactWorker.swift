//
//  ContactWorker.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 05/02/22.
//

import Foundation

protocol ContactListLogic {
    func fetchContactList(completion: @escaping (Result<ContactListEntity, ContactListWorker.ContactWorkerError>) -> Void)
}

final class ContactListWorker {
    private let service: FinanceService
    
    init(service: FinanceService) {
        self.service = service
    }
    
    enum ContactWorkerError: Error {
        case getContactListError(String)
        case decodeError
    }
}

extension ContactListWorker: ContactListLogic {
    func fetchContactList(completion: @escaping (Result<ContactListEntity, ContactWorkerError>) -> Void) {
        do {
            guard let data = service.readLocalFile(forName: "contact_list_endpoint") else { return }
            let contactList = try JSONDecoder().decode(ContactListEntity.self, from: data)
            completion(.success(contactList))
        } catch {
            completion(.failure(ContactWorkerError.decodeError))
        }
    }
}

