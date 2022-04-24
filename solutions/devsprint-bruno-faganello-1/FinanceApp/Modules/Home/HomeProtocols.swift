//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Victor Catão on 20/03/22.
//

import Foundation
import UIKit

// MARK: - HomePresenterProtocol

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeIteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: - HomeRouterProtocol

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
}

// MARK: - HomeIteractorProtocol

protocol HomeIteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    
    func fetchData()
}
