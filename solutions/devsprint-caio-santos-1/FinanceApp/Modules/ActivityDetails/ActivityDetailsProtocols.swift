//
//  ActivityDetailsProtocols.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation
import UIKit

protocol ActivityDetailsPresenterProtocol {
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? { get set }
    var router: ActivityDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
    func reportIssue()
    func alert(title: String, message: String, viewController: UIViewController)
}

protocol ActivityDetailsRouterProtocol {
    static func createModule() -> UIViewController
}

protocol ActivityDetailsInteractorProtocol {
    var presenter: ActivityDetailsInteractorDelegate? { get set }
    func fetchData()
    func reportIssue()
}
