//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import UIKit

protocol ActivityDetailsRouterInput {
    func createModule() -> ActivityDetailsViewController
}

final class ActivityDetailsRouter: ActivityDetailsRouterInput {
    weak var viewController: UIViewController?
    
    func createModule() -> ActivityDetailsViewController {
        return ActivityDetailsFactory.build()
    }
}
