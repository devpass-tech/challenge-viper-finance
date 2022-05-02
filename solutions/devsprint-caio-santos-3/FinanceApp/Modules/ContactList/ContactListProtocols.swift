//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation
import UIKit

protocol ContactListPresenterProtocol {

    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }

    func viewDidLoad()
}

protocol ContactListRouterProtocol {

    static func createModule() -> UINavigationController
    func navigateToNewModule()
}

protocol ContactListInteractorProtocol {

    var presenter: ContactListInteractorDelegate? { get set }
    func fetchData()
}

//Mark: Delegate Protocols

protocol ContactListPresenterDelegate: AnyObject {

    func showData()
}

protocol ContactListInteractorDelegate: AnyObject {

    func didFetchData()
}
