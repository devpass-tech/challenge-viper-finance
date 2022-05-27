//
//  ActivityDetailsConfigurator.swift
//  FinanceApp
//
//  Created by Mobills on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation
import UIKit

final class ActivityDetailsConfigurator: ActivityDetailsConfiguratorProtocol {
    
    static func createModule() -> UIViewController {
        let view = ActivityDetailsViewController()
        let interactor = ActivityDetailsInteractor()
        let presenter = ActivityDetailsPresenter()
        let router = ActivityDetailsRouter()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        return view
    }
}
