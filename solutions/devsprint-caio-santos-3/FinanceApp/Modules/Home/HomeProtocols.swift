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
    func presentUserProfile()
    func pushToActivityDetails()
}

protocol HomeRouterProtocol {
    var viewController: UIViewController?  { get set }
    
    static func createModule() -> UIViewController
    
    func presentUserProfile()
    func pushToActivityDetails()
}

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    
    func fetchData()
}
