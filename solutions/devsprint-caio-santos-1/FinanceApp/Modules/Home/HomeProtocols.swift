//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import UIKit

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    func didFetchData()
}

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
    func pushToUserProfile(navigation: UINavigationController)
    func pushToActivityDetails(navigation: UINavigationController)
}

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
    func pushToUserProfile(navigation: UINavigationController)
    func pushToActivityDetails(navigation: UINavigationController)
}
