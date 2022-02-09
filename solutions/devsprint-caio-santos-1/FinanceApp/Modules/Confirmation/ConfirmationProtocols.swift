//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation
import UIKit

protocol ConfirmationPresenterProtocol {
    
    var view: ConfirmationPresenterDelegate? { get set }
    var interactor: ConfirmationInteractorProtocol? { get set }
    var router: ConfirmationRouterProtocol? { get set }
    
    func viewDidLoad()
    func getText() -> String
    func getColorIcon() -> UIColor
    func getButtonTitle() -> String
}

protocol ConfirmationRouterProtocol {
    
    static func createModule(statusTransfer: Bool) -> UINavigationController
}

protocol ConfirmationInteractorProtocol {
    
    var presenter: ConfirmationInteractorDelegate? { get set }
}
