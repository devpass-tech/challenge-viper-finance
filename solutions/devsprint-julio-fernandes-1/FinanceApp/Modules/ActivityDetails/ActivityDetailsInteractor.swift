//
//  ActivityDetailsInteractor.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import UIKit

protocol ActivityDetailsInteractorDelegate: AnyObject {
    
    func didFetchData()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
}
