//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import Foundation

final class UserProfilePresenter: UserProfilePresenterProtocol {
    
    private var user: UserEntity? = nil

    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?

    func viewDidLoad() {
        interactor?.fetchData()
    }

    func getUserProfileCell(indexPath: IndexPath) -> AccountCell? {
        guard let user = user else { return nil }
        
        switch indexPath.row {
            case 0:
                return AccountCell(title: "Phone", description: user.phone)
            case 1:
                return  AccountCell(title: "E-mail", description: user.email)
            case 2:
                return  AccountCell(title: "Address", description: user.address)
            default: return nil
        }
    }

}

extension UserProfilePresenter: UserProfileInteractorDelegate {
    
    func didFetchData(_ user: UserEntity) {
        self.user = user
        view?.showData(with: user)
    }
    
    func didErrorData(error: FinanceServiceError) { }

}
