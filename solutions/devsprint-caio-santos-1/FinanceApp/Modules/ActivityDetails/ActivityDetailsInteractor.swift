//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
}
