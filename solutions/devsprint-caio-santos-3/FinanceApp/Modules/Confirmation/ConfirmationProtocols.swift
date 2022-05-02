//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 28/04/22.
//

import Foundation
import UIKit

protocol ConfirmationPresenterProtocol: AnyObject {
    
    var view: ConfirmationPresenterDelegate? { get set }

    func viewDidLoad()
    
}

protocol ConfirmationInteractorProtocol: AnyObject {
    
    var presenter: ConfirmationInteractorDelegate? { get set}
    func fetchData()
}

protocol ConfirmationRouterProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    func navigateNewModule()
    
}
