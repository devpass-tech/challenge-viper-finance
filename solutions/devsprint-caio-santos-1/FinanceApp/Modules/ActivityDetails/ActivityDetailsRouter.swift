//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation
import UIKit

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    static func createModule() -> UIViewController {
        let viewController = ActivityDetailsViewController()
        
        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ActivityDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ActivityDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
