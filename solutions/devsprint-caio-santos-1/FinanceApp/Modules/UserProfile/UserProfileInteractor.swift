//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Thiago Henrique Alves Ferreira on 02/02/22.
//

import Foundation

protocol UserProfileInteractorProtocol {
    
    var presenter: UserProfileInteractorDelegate? { get set }
    func fetchData()
}

protocol UserProfileInteractorDelegate: AnyObject {
    
    func didFetchData()
}

final class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
    
    
}
