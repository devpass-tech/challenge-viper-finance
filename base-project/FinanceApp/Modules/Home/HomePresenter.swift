//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {

}

class HomePresenter: HomePresenterProtocol {

    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
}

extension HomePresenter: HomeInteractorDelegate {

}
