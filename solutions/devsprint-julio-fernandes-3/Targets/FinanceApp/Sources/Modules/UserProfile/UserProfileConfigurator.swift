//
//  UserProfileConfigurator.swift
//  FinanceApp
//
//  Created by Mobills on 02/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation
import UIKit

final class UserProfileConfigurator {
    
    static func createModule() -> UIViewController {
        
        let interactor = UserProfileInteractor()
        let presenter = UserProfilePresenter()
        let viewController = UserProfileViewController()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        viewController.presenter = presenter
        
        return viewController
        
    }
    
}
