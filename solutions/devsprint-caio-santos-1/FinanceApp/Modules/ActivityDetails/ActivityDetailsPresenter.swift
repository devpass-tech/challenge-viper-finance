//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation
import UIKit

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func showData()
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
    
    func didFetchData() {
        view?.showData()
    }
}
