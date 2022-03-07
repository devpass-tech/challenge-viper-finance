//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation
import UIKit

 // MARK: - ViewController
protocol ConfirmationViewControllerInputProtocol: AnyObject {
    func getText() -> String
    func getColorIcon() -> UIColor
    func getButtonTitle() -> String
    func didTapConfirmationButton()
}

protocol ConfirmationPresenterOutputProtocol: AnyObject {
    
}

 // MARK: - Presenter
protocol ConfirmationPresenterInputProtocol: AnyObject {
    func getText() -> String
    func getColorIcon() -> UIColor
    func getButtonTitle() -> String
}

 // MARK: - Interactor
protocol ConfirmationInteractorInputProtocol: AnyObject {
    
}

protocol ConfirmationInteractorOutputProtocol: AnyObject {
    
}

 // MARK: - Router
protocol ConfirmationRouterProtocol: AnyObject {
    
}
