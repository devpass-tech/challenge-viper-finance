//
//  ActivityDetailsFactory.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import Foundation

enum ActivityDetailsFactory {
    static func build() -> ActivityDetailsViewController {
        let service = FinanceService()
        let interactor = ActivityDetailsInteractor(service: service)
        let router = ActivityDetailsRouter()
        let presenter = ActivityDetailsPresenter(
            interactor: interactor,
            router: router)
        let controller = ActivityDetailsViewController(presenter: presenter)
        presenter.view = controller
        interactor.presenter = presenter
        
        return controller
    }
}
