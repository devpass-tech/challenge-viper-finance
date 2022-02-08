//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import UIKit

protocol ActivityDetailsInteractorDelegate: AnyObject {
    
    func didFetchData(activity: ActivityDetailsEntity)
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let activity = ActivityDetailsEntity(name: "Mall", category: "Shopping", time: "08:57 AM", price: 100.0)
            self.presenter?.didFetchData(activity: activity)
        }
    }
}
