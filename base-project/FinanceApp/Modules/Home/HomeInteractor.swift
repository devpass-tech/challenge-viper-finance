//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {

}

class HomeInteractor: HomeInteractorProtocol {

    weak var presenter: HomeInteractorDelegate?

}
