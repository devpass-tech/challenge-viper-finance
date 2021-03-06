//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class HomePresenter: HomePresenterProtocol {
    
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
        view?.setupNavigationItem(UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile)))
    }
    
    @objc
    func openProfile() {
        router?.navigateToProfileModule()
    }
    
    func openActivityDetails() {
        router?.navigateToActivityDetailsModule()
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didFetchData() {
        view?.reloadData()
    }
}
