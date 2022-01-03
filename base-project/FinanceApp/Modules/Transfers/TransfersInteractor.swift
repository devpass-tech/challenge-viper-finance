//
//  TransfersInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol TransfersInteractorDelegate: AnyObject {

}

class TransfersInteractor: TransfersInteractorProtocol {

    weak var presenter: TransfersInteractorDelegate?

}
