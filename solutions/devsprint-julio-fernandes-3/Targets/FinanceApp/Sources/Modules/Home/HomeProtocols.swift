//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

//MARK: HomePresenterProtocol (input)
protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }

    func viewDidLoad()
}

//MARK: HomePresenterDelegate (output)
protocol HomePresenterDelegate: AnyObject {
    func reloadData()
    func setupNavigationItem(_ item: UIBarButtonItem)
}

//MARK: HomeInteractorProtocol (input)
protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    
    func fetchTotal()
    func fetchSavings()
    func fetchSpendings()
    func fetchActivities()
}

//MARK: HomeInteractorDelegate (output)
protocol HomeInteractorDelegate: AnyObject {
    func didFetchData()
}

//MARK: HomeConfiguratorProtocol
protocol HomeConfiguratorProtocol {
    static func createModule() -> UIViewController
}

//MARK: HomeRouterProtocol
protocol HomeRouterProtocol {
    var view: UIViewController? { get  set }
    func navigateToProfileModule()
}
