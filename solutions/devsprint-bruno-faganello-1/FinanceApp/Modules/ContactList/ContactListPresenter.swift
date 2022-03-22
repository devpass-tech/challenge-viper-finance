//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Victor Catão on 21/03/22.
//

import Foundation

// MARK: - ContactListPresenterDelegate

protocol ContactListPresenterDelegate: AnyObject {
    
}

// MARK: - ContactListPresenter

final class ContactListPresenter: ContactListPresenterProtocol {
    
    // MARK: Public Properties
    
    var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    // MARK: Public Methods

    func viewDidLoad() {
        
    }
}

// MARK: - ContactListInteractorDelegate
extension ContactListPresenter: ContactListInteractorDelegate {
    
}
