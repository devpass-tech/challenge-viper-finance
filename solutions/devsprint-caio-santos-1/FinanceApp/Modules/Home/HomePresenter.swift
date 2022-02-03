//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import Foundation
import UIKit

protocol HomePresenterDelegate: AnyObject {
    func showData()
}

final class HomePresenter: HomePresenterProtocol {
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interactor?.didFetchData()
    }
    
    func pushToActivityDetails(navigation: UINavigationController) {
        router?.pushToActivityDetails(navigation: navigation)
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didFetchData() {
        view?.showData()
    }
}
