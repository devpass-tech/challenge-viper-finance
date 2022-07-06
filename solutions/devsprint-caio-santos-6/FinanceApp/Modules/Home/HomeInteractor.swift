//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by Yannes Meneguelli on 04/07/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {}

class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
}
