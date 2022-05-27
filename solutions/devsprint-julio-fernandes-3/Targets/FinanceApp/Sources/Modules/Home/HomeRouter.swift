//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {

    var view: UIViewController?
    
    func navigateToProfileModule() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        view?.present(navigationController, animated: true)
    }
}
