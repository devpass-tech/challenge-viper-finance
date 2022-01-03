//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {

}

class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {

    weak var presenter: ActivityDetailsInteractorDelegate?

}
