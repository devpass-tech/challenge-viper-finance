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
        let view = ActivityDetailsView()
        let controller = ActivityDetailsViewController(activityDetailsView: view)
        let presenter = ActivityDetailsPresenter()
        let router = ActivityDetailsRouter()
        let interactor = ActivityDetailsInteractor(
            service: MainQueueActivityDetailsServiceDecorator(TempActivityDetailsService())
        )
        
        controller.presenter = presenter
        interactor.presenter = presenter
        presenter.view = controller
        presenter.interactor = interactor
        presenter.router = router
        router.view = controller
        
        return controller
    }
}

final class MainQueueActivityDetailsServiceDecorator: TempActivityDetailsServiceProtocol {
   
    private let actualService: TempActivityDetailsServiceProtocol
    
    init(_ actualService: TempActivityDetailsServiceProtocol) {
        self.actualService = actualService
    }
    
    func fetch(completion: @escaping (ActivityDetailsDTO) -> Void) {
        actualService.fetch() { [weak self] data in
            self?.runInMainThread {
                completion(data)
            }
        }
    }
    
    func runInMainThread(_ work: @escaping () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.async {
                work()
            }
        }
    }
}
