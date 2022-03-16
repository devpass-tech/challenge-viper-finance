//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import Foundation

// MARK: - ActivityDetailsPresenterDelegate

protocol ActivityDetailsPresenterDelegate: AnyObject {}

// MARK: - ActivityDetailsPresenter

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    // MARK: Public Properties

    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
}

// MARK: - ActivityDetailsInteractorDelegate

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    
}
