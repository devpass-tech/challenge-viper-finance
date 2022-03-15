//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Victor Catão on 14/03/22.
//

import Foundation

// MARK: - ActivityDetailsInteractorDelegate

protocol ActivityDetailsInteractorDelegate: AnyObject {
    
}

// MARK: - ActivityDetailsInteractor

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    // MARK: Public Properties
    
    weak var presenter: ActivityDetailsInteractorDelegate?
}
