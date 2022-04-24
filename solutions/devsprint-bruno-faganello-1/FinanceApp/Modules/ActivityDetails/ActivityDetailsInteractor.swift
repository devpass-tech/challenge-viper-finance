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
    func didFailFetchActivity(error: ActivityDetailError?)
}

// MARK: - ActivityDetailsInteractor

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    // MARK: Public Properties
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    // MARK: - Private Properties

    private let repository: ActivityDetailRepositoryProtocol
    
    init(repository: ActivityDetailRepositoryProtocol = ActivityDetailRepository()) {
        self.repository = repository
    }

    // MARK: - Public Methods

    func fetchData() {
        repository.fetchActivityDetail { [weak self] activity, error in
            guard let self = self else { return }
            guard let activity = activity else {
                self.presenter?.didFailFetchActivity(error: error)
                return
            }
            self.presenter?.didFetchActivity(activity)
        }
    }
}
