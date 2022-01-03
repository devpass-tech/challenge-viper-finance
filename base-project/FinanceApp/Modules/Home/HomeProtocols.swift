//
//  HomeProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol HomePresenterProtocol {

    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
}

protocol HomeRouterProtocol {

    static func createModule() -> UIViewController
}

protocol HomeInteractorProtocol {

    var presenter: HomeInteractorDelegate? { get set }
}


