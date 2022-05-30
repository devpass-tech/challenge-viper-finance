//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 27/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class TransfersRouter: TransfersRouterProtocol {
    var view: UIViewController?
    
    func navigateToContactListModule() {
        let navigationController = UINavigationController(rootViewController: ContactListViewController())
        view?.present(navigationController, animated: true)
    }
    
    func navigateToConfirmationModule() {
        let navigationController = UINavigationController(rootViewController: ConfirmationViewController())
        view?.present(navigationController, animated: true)
    }
}
