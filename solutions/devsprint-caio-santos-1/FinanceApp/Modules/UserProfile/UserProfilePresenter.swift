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
    func getUserName() -> String
    func getAgency() -> String
    func getAccount() -> String
    func getBank() -> String
    func getPhone() -> String
    func getEmail() -> String
    func getAddress() -> String
    func numberOfSections() -> Int
    func numberOfRows() -> Int
}

protocol UserProfilePresenterDelegate: AnyObject {
    func showData(with userProfile: UserProfileEntity)
}


final class UserProfilePresenter: UserProfilePresenterProtocol {
    
    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?
    
    var userProfile: UserProfileEntity?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func getUserName() -> String {
        return self.userProfile?.name ?? ""
    }
    
    func getAgency() -> String {
        return self.userProfile?.account.agency ?? ""
    }
    
    func getAccount() -> String {
        return self.userProfile?.account.account ?? ""
    }
    
    func getBank() -> String {
        return self.userProfile?.account.bank ?? ""
    }
    
    func getPhone() -> String {
        return self.userProfile?.phone ?? ""
    }
    
    func getEmail() -> String {
        return self.userProfile?.email ?? ""
    }
    
    func getAddress() -> String {
        return self.userProfile?.address ?? ""
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return 3
    }
}

extension UserProfilePresenter: UserProfileInteractorDelegate {
    func didFetchData(_ user: UserProfileEntity?) {
        self.userProfile = user
    }
    
}
