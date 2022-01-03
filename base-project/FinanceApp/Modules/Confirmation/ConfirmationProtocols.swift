//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ConfirmationPresenterProtocol {

    var view: ConfirmationPresenterDelegate? { get set }
    var interactor: ConfirmationInteractorProtocol? { get set }
    var router: ConfirmationRouterProtocol? { get set }
}

protocol ConfirmationRouterProtocol {

    static func createModule() -> UIViewController
}

protocol ConfirmationInteractorProtocol {

    var presenter: ConfirmationInteractorDelegate? { get set }
}


