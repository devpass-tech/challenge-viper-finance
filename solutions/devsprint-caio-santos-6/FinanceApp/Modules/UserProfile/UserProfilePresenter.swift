//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/07/22.
//

import Foundation

class UserProfilePresenter: UserProfilePresenterProtocol {
    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?
    
    var user: User?
    var accountInfos: [AccountData]?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func showSelectedValue(index: Int) -> String? {
        guard let data = accountInfos,
              let label = data[index].label,
              let value = data[index].value else {
            return nil
        }
        
        return "Você tocou no item \(label), cujo valor é \(value)"
    }
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(at section: Int) -> Int {
        accountInfos?.count ?? 0
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        "My account"
    }
    
    func getLabelValue(at indexPath: IndexPath) -> (label: String, value: String) {
        guard let data = accountInfos,
              let label = data[indexPath.row].label,
              let value = data[indexPath.row].value else {
            return (label: "", value: "")
        }
        
        return (label: label, value: value)
    }
}

extension UserProfilePresenter: UserProfileInteractorDelegate {
    func didFetchData(user: User, accountInfos: [AccountData]) {
        self.user = user
        self.accountInfos = accountInfos
        view?.showData()
    }
    
    func didFetchDataWithError() {
        view?.showError()
    }
}
