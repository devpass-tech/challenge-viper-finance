//
//  HomeViewProtocols.swift
//  FinanceApp
//
//  Created by pedro tres on 26/04/22.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRouterProtocol { get set }
    
    func viewDidLoad()
    func pushToUserProfile(navigation: UINavigationController)
    func pushToActivityDetails(navigation: UINavigationController)
}

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
    
    func pushToUserProfile(navigation: UINavigationController)
    func pushToActivityDetails(navigation: UINavigationController)
}

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    
    func fetchData()
}
