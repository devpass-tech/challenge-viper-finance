//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Mobills on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

struct ActivityDetailsDTO {
    var activityName: String
    var category: String
    var price: Double
    var time: Date
    var imageName: String
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    let service: TempActivityDetailsServiceProtocol
    
    init(service: TempActivityDetailsServiceProtocol) {
        self.service = service
    }
    
    func fetchData() {
        service.fetch() { [weak self] data in
            self?.presenter?.didFetch(data: data)
        }
    }
}
