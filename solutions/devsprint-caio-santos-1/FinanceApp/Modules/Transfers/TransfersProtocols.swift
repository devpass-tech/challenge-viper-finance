//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

protocol TransfersPresenterProtocol {
    
    var view: TransfersPresenterDelegate? { get set }
    var interactor: TransfersInteractorProtocol? { get set }
    var router: TransfersRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol TransfersRouterProtocol {
    
    static func createModule() -> UINavigationController
    func navigateToNewModule()
}

protocol TransfersInteractorProtocol {
    
    var presenter: TransfersInteractorDelegate? { get set }
    func fetchData()
}
