//
//  HomeConfigurator.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class HomeConfigurator: HomeConfiguratorProtocol {
    
    static func createModule() -> UIViewController {
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }

}
