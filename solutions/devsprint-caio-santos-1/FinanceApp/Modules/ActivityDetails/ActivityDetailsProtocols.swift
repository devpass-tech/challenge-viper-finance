//
//  ActivityDetailsProtocols.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import UIKit

protocol ActivityDetailsPresenterProtocol {
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? { get set }
    var router: ActivityDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
    func reportIssue()
    func getName() -> String
    func getCategory() -> String
    func getPrice() -> String
    func getTime() -> String
}

protocol ActivityDetailsRouterProtocol {
    static func createModule() -> UIViewController
}

protocol ActivityDetailsInteractorProtocol {
    var presenter: ActivityDetailsInteractorDelegate? { get set }
    func fetchData()
    func reportIssue()
}

protocol ActivityDetailsViewControllerProtocol {
    func getName() -> String
    func getCategory() -> String
    func getPrice() -> String
    func getTime() -> String
}
