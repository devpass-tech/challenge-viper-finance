//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    func didFetchData()
}

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
    
    func didFetchData() {
        presenter?.didFetchData()
    }
}