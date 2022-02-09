//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import UIKit

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData(activity: ActivityDetailsEntity)
    func didReportIssue()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        let activity: ActivityDetailsEntity = ActivityDetailsEntity(name: "Mall 3", category: "Shopping", price: 99.0, time: "10:01 AM")
        presenter?.didFetchData(activity: activity)
    }
    
    func reportIssue() {
        presenter?.didReportIssue()
    }
}
