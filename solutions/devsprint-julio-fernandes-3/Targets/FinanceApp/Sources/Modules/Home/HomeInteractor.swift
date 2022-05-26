//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

final class HomeInteractor: HomeInteractorProtocol {
    
    weak var presenter: HomeInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
    
    
}
