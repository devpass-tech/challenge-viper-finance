//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ContactListPresenterProtocol {

    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
}

protocol ContactListRouterProtocol {

    static func createModule() -> UIViewController
}

protocol ContactListInteractorProtocol {

    var presenter: ContactListInteractorDelegate? { get set }
}


