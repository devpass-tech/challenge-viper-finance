//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import Foundation

protocol UserProfilePresenterProtocol {
    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }
    var router: UserProfileRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserProfilePresenterDelegate: AnyObject {
    func showData()
}


final class UserProfilePresenter: UserProfilePresenterProtocol {
    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}

extension UserProfilePresenter: UserProfileInteractorDelegate {
    func didFetchData() {
        view?.showData()
    }
    
}
