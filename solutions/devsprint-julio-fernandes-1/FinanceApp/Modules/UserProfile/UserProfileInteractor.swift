//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 01/02/22.
//

import Foundation

protocol UserProfileInteractorDelegate: AnyObject {
	func didFetchData()
}

final class UserProfileInteractor: UserProfileInteractorProtocol {
	weak var presenter: UserProfileInteractorDelegate?
	
	func fetchData() {
		presenter?.didFetchData()
	}

}
