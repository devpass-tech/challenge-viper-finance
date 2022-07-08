//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Andre Almeida on 06/07/22.
//

import Foundation

protocol ContactListPresenterProtocol: AnyObject {
	var view: ContactListPresenterDelegate? { get set }
	func numberOfRowsInSection() -> Int
	func getDTOforCell(at row: IndexPath) -> ContactCellView.DTO?
}

protocol ContactListPresenterDelegate: AnyObject  {
	
}

