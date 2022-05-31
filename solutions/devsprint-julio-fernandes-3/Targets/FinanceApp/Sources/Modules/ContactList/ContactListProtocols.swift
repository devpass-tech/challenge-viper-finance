//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 30/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

// MARK: ContactListPresenterProtocol
protocol ContactListPresenterProtocol {
    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: ContactListPresenterDelegate
protocol ContactListPresenterDelegate: AnyObject {
    func showData()
}

// MARK: ContactListInteractorProtocol
protocol ContactListInteractorProtocol {
    var presenter: ContactListInteractorDelegate? { get set }
    func fetchData()
}

// MARK: ContactListInteractorDelegate
protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData()
}

// MARK: ContactListConfiguratorProtocol
protocol ContactListConfiguratorProtocol {
    static func createModule() -> UIViewController
}

// MARK: ContactListRouterProtocol
protocol ContactListRouterProtocol {}
