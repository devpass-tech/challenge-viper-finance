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
    
    func didFetchData(_ user: UserProfileEntity?)
}

final class UserProfileInteractor: UserProfileInteractorProtocol {
    weak var presenter: UserProfileInteractorDelegate?
    
    func fetchData() {
        var userProfile: UserProfileEntity?
        
        UserProfileWorker(service: FinanceService()).fetchUserProfile(completion: { result in
            switch result {
            case .success(let user):
                userProfile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
        
        presenter?.didFetchData(userProfile)
    }
    
    
}
