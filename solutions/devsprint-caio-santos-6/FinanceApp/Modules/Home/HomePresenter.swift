//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by Yannes Meneguelli on 04/07/22.
//

import Foundation
import UIKit

protocol HomePresenterDelegate: AnyObject {
}

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {}
    
    func navigationToNewScreen(navigation: UINavigationController) {
        router?.navigationToNewScreen(navigation: navigation)
    }
}

extension HomePresenter: HomeInteractorDelegate {}
