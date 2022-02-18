//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData(_ activity: ActivityDetailsEntity?)
    func didReportIssue()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        ActivityDetailsWorker(service: FinanceService()).fetchData { result in
            switch result {
            case .success(let activity):
                self.presenter?.didFetchData(activity)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reportIssue() {
        presenter?.didReportIssue()
    }
}
