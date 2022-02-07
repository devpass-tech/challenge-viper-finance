//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import UIKit

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func showData(activity: ActivityDetailsEntity)
    func didReportIssue()
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func reportIssue() {
        interactor?.reportIssue()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    func didReportIssue() {
        view?.didReportIssue()
    }
    
    func didFetchData(activity: ActivityDetailsEntity) {
        view?.showData(activity: activity)
    }
}
