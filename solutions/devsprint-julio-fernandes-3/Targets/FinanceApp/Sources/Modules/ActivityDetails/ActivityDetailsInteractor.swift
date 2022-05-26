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
    
    private let data = ActivityDetailsDTO(
        activityName: "Mall",
        category: "Shopping",
        price: 100,
        time: Date(timeIntervalSince1970: 1653566228),
        imageName: "bag.circle.fill"
    )
    
    func fetchData() {
        presenter?.didFetch(data: data)
    }
}
