//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Yannes Meneguelli on 04/07/22.
//

import UIKit

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
}

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
    func navigationToNewScreen(navigation: UINavigationController)
}

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
    func navigationToNewScreen(navigation: UINavigationController)
}
