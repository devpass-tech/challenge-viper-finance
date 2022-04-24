//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 01/02/22.
//

import Foundation

protocol UserProfilePresenterDelegate: AnyObject {
	func showData()
}

final class UserProfilePresenter: UserProfilePresenterProtocol {
	
	weak var view: UserProfilePresenterDelegate?
	var interactor: UserProfileInteractorProtocol
	var router: UserProfileRouterProtocol
	
	init(
		interactor: UserProfileInteractorProtocol,
		router: UserProfileRouterProtocol
	) {
		self.interactor = interactor
		self.router = router
	}
		
	func viewDidLoad() {
		interactor.fetchData()
	}
}

extension UserProfilePresenter: UserProfileInteractorDelegate {

    func didFetchData(_ userProfile: UserEntity) {
        view?.showData()
    }

}
