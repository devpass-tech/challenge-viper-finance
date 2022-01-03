//
//  ActivityDetailsProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ActivityDetailsPresenterProtocol {

    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? { get set }
    var router: ActivityDetailsRouterProtocol? { get set }
}

protocol ActivityDetailsRouterProtocol {

    static func createModule() -> UIViewController
}

protocol ActivityDetailsInteractorProtocol {

    var presenter: ActivityDetailsInteractorDelegate? { get set }
}


