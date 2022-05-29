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
        view?.setupNavigationItem(UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile)))
    }
    
    @objc
    func openProfile() {
        router?.navigateToProfileModule()
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didFetchData() {
        view?.reloadData()
    }
}
