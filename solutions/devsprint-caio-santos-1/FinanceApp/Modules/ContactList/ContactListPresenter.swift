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
    func getNameLabel(at index: Int) -> String
    func getPhoneLabel(at index: Int) -> String
    func numberOfRowsInSection() -> Int
}

protocol ContactListPresenterDelegate: AnyObject {
    func showData(with contactList: ContactListEntity)
}


final class ContactListPresenter: ContactListPresenterProtocol {
    var contactList: ContactListEntity = []
    
    func getNameLabel(at index: Int) -> String {
        self.contactList[index].name
    }
    
    func getPhoneLabel(at index: Int) -> String {
        self.contactList[index].phone
    }
    
    func numberOfRowsInSection() -> Int {
        self.contactList.count
    }
    
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(_ contactList: ContactListEntity) {
        self.contactList = contactList
    }
}
