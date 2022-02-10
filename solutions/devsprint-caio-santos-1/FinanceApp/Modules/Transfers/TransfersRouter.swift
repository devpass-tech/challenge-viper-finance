//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 31/01/22.
//

import Foundation
import UIKit

final class TransfersRouter {

    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

extension TransfersRouter: TransfersRouterProtocol {
    func navigateToContactList() {
        viewController?.navigationController?.present(ContactListRouter.createModule(), animated: true)
    }
    
    func navigateToConfirmation(isTransferSuccess: Bool) {
        let transporter = ConfirmationTransporter(success: isTransferSuccess)
        viewController?.navigationController?.present(ConfirmationConfigurator().createModule(transporter: Transporter(data: transporter)), animated: true)
    }
}
