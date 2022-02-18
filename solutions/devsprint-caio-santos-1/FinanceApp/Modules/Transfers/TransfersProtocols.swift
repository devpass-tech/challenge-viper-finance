//
//  TransfersProtocols.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

// MARK: - ViewController
protocol TransfersViewControllerInputProtocol: AnyObject {
    func didTapContactButton()
    func didTapConfirmationButton(value: String)
}

protocol TransfersPresenterOutputProtocol: AnyObject {

}

// MARK: - Presenter
protocol TransfersPresenterInputProtocol: AnyObject {
    func navigateToContactView()
    func createTransfer(value: String)
}

// MARK: - Interactor
protocol TransfersInteractorInputProtocol: AnyObject {
    func createTransfer(value: String)
}

protocol TransfersInteractorOutputProtocol: AnyObject {
    func didCreateTransferSuccessful()
    func didErrorTransfer()
}

// MARK: - Router
protocol TransfersRouterProtocol: AnyObject {
    func navigateToContactList()
    func navigateToConfirmation(isTransferSuccess: Bool)
}
