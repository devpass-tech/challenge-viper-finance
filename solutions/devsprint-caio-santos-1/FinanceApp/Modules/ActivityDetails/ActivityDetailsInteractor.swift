//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import UIKit

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData()
    func didReportIssue()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
    
    func reportIssue() {
        presenter?.didReportIssue()
    }
}
