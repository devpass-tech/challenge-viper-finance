//
//  ActivityDetailsProtocol.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 26/04/22.
//

import Foundation
import UIKit

protocol ActivityDetailsPresenterProtocol {
    
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? { get set }
    var router: ActivityDetailsRouterProtocol? { get set }

    func viewDidLoad()
}

protocol ActivityDetailsRouterProtocol {
    
    static func createModule() -> UINavigationController
    func navigateToNewModule()

}

protocol ActivityDetailsInteractorProtocol {

    var presenter: ActivityDetailsInteractorDelegate? { get set }
    func fetchData()
}
