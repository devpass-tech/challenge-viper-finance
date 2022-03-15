//
//  ActivityDetailsProtocols.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import UIKit

// MARK: - ActivityDetailsPresenterProtocol

protocol ActivityDetailsPresenterProtocol {
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? { get set }
    var router: ActivityDetailsRouterProtocol? { get set }

    func viewDidLoad()
}

// MARK: - ActivityDetailsRouterProtocol

protocol ActivityDetailsRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToNewModule()
}

// MARK: - ActivityDetailsInteractorProtocol

protocol ActivityDetailsInteractorProtocol {
    var presenter: ActivityDetailsInteractorDelegate? { get set }
}
