//
//  ContactListInteractor.swift
//  FinanceApp
//
//  Created by Andre Almeida on 07/07/22.
//

import Foundation

class ContactListInteractor: ContactListInteractorProtocol {
		
	var presenter: ContactListInteractorDelegate?
	
	func fetchData() {
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) { [weak self] in
			let successChance = Int.random(in: 1...4)
			switch successChance {
			case 1:
				self?.presenter?.didFetchData(contacts: (0..<10).map {
					.init(name: "Nome \($0)", phone: "1234-45678", image: "avatar-placeholder")
				} )
			default:
				self?.presenter?.didFetchWithError()
			}
		}
	}
}
