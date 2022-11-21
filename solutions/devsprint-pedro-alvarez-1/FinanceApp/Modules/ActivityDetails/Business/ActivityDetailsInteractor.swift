//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

protocol ActivityDetailsInteractorInput {
    func fetchDetails()
}

protocol ActivityDetailsInteractorOutput: AnyObject {
    func didFetchDetail(_ data: ActivityDetailsEntity)
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorInput {
    private let service: FinanceServiceProtocol
    weak var  presenter: ActivityDetailsInteractorOutput?
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }
    
    func fetchDetails() {
        service.fetchActivityDetails { [weak self] result in
            guard let data = result else { return }
            self?.presenter?.didFetchDetail(data)
        }
    }
}
