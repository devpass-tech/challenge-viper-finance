//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 30/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
}
