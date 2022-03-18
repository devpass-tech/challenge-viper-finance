//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import Foundation

// MARK: - ActivityDetailsInteractorDelegate

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchActivity(_ activity: Activity)
}

// MARK: - ActivityDetailsInteractor

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    // MARK: Public Properties
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    private let service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    // MARK: - Public Methods

    func fetchData() {
        Task.init(priority: .background) {
            let result = await service.fetchActivityDetail()
            switch result {
            case .success(let activityDetail):
                presenter?.didFetchActivity(activityDetail)
            case .failure:
                break
            }
        }
    }
}
