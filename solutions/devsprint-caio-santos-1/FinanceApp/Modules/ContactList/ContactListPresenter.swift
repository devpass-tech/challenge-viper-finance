//
//  ContactListPresenter.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import Foundation

protocol ContactListPresenterProtocol {
    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol ContactListPresenterDelegate: AnyObject {
    func showData(with contactList: ContactListEntity)
}


final class ContactListPresenter: ContactListPresenterProtocol {
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(_ contactList: ContactListEntity) {
        view?.showData(with: contactList)
    }
}
