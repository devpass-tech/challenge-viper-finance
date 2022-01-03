//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ConfirmationInteractorDelegate: AnyObject {

}

class ConfirmationInteractor: ConfirmationInteractorProtocol {

    weak var presenter: ConfirmationInteractorDelegate?

}
