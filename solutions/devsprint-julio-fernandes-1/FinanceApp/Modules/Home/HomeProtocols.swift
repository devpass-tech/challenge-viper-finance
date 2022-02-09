//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Mateus Nazario on 09/02/22.
//

import UIKit


protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRouterProtocol { get set }
    
    func viewDidLoad()
}

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
}

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    func didFetchData()
}
