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
    var router: ContactListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}
