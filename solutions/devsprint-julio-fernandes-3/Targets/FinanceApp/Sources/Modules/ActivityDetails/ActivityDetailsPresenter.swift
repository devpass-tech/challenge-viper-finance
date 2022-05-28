//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Mobills on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation
import UIKit

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    private func parse(activityDetailsDTO: ActivityDetailsDTO) -> ActivityDetailsViewModel {
        return ActivityDetailsViewModel(
            activityName: activityDetailsDTO.activityName,
            category: activityDetailsDTO.category,
            price: convert(price: activityDetailsDTO.price),
            time: convert(time: activityDetailsDTO.time),
            image: UIImage(named: activityDetailsDTO.imageName)
        )
    }
    
    private func convert(price: Double) -> String {
        return "$\(String(format: "%.2f", price))"
    }
    
    private func convert(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: time)
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    
    func didFetch(data: ActivityDetailsDTO) {
        let activityViewModel = self.parse(activityDetailsDTO: data)
        view?.update(viewModel: activityViewModel)
    }
}
