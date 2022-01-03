//
//  UserProfileInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol UserProfileInteractorDelegate: AnyObject {

}

class UserProfileInteractor: UserProfileInteractorProtocol {

    weak var presenter: UserProfileInteractorDelegate?

}
