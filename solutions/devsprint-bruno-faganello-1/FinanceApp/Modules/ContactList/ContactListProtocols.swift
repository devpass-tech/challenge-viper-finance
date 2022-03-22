//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Victor Catão on 21/03/22.
//

import Foundation
import UIKit

// MARK: - ContactListPresenterProtocol

protocol ContactListPresenterProtocol {
    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: - ContactListRouterProtocol

protocol ContactListRouterProtocol {
    static func createModule() -> UIViewController
}

// MARK: - ContactListInteractorProtocol

protocol ContactListInteractorProtocol {
    var presenter: ContactListInteractorDelegate? { get set }
    
    func fetchData()
}
