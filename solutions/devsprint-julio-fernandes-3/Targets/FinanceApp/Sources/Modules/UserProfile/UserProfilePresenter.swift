//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Mobills on 02/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class UserProfilePresenter: UserProfilePresenterProtocol {
    
    weak var view: UserProfileViewDelegate?
    var interactor: UserProfileInteractorProtocol?
    var router: UserProfileRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
}

extension UserProfilePresenter: UserProfileInteractorDelegate {
    func didLoadData(_ userData: UserData) {
        view?.update(userData: userData)
    }
}
