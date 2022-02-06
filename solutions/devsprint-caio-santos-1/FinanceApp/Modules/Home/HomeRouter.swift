//
//  HomeRouter.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {
    static func createModule() -> UIViewController {
        let viewController: HomeViewController = HomeViewController()
        let presenter: HomePresenterProtocol & HomeInteractorDelegate = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    func pushToUserProfile(navigation: UINavigationController) {
        navigation.present(UserProfileRouter.createModule(), animated: true)
    }
    
    func pushToActivityDetails(navigation: UINavigationController) {
        navigation.pushViewController(ActivityDetailsRouter.createModule(), animated: true)
    }
    
    func pushToSampleV2(navigation: UINavigationController) {
        let transporter = SampleV2Transporter(value1: nil, value2: nil)
        let configurator = SampleV2Configurator()
        navigation.pushViewController(configurator.createModule(transporter: Transporter(data: transporter)), animated: true)
    }
}
