//
//  UserProfilePresenterProtocol.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import UIKit

// MARK: - Protocols Presenter
protocol UserProfilePresenterProtocol {
    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }
    var router: UserProfileRouterProtocol? { get set }

    func viewDidLoad()
}

protocol UserProfilePresenterDelegate: AnyObject {
    func showData()
}

// MARK: - Protocols Interactor
protocol UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate? { get set }

    func fetchData()
}

protocol UserProfileInteractorDelegate: AnyObject {
    func didFetchData()
}

// MARK: - Protocols Router
protocol UserProfileRouterProtocol {
    static func createModule() -> UINavigationController
}
