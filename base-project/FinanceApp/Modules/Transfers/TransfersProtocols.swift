//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol TransfersPresenterProtocol {

    var view: TransfersPresenterDelegate? { get set }
    var interactor: TransfersInteractorProtocol? { get set }
    var router: TransfersRouterProtocol? { get set }
}

protocol TransfersRouterProtocol {

    static func createModule() -> UIViewController
}

protocol TransfersInteractorProtocol {

    var presenter: TransfersInteractorDelegate? { get set }
}


