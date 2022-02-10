//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation
import UIKit

final class ConfirmationPresenter {

    // MARK: - VIPER Properties
    
    weak var viewController: ConfirmationViewController?
    private let router: ConfirmationRouterProtocol
    private let interactor: ConfirmationInteractorInputProtocol
    
    // MARK: Internal Properties
    
    private var transporter: ConfirmationTransporter?
    
    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(
        router: ConfirmationRouterProtocol,
        interactor: ConfirmationInteractorInputProtocol,
        transporter: Transporter<Any>?
    ) {
        self.router = router
        self.interactor = interactor
        self.transporter = transporter?.data as? ConfirmationTransporter
    }
}

extension ConfirmationPresenter: ConfirmationPresenterInputProtocol {
    func getText() -> String {
        transporter?.success ?? false ? "Your transfer was successful" : "Your transfer was failed"
    }
    func getColorIcon() -> UIColor {
        transporter?.success ?? false ? .systemGreen : .systemRed
    }
    func getButtonTitle() -> String {
        transporter?.success ?? false ? "Nice!" : "Ok"
    }
    
}

extension ConfirmationPresenter: ConfirmationInteractorOutputProtocol {
    
}
