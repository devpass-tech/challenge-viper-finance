//
//  HomeInteractor.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    func didRetriveHomeInfo(message: String)
    func onError(message: String)
}

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
    
    let isSuccess = Bool.random()
    
    func didFetchData() {
        if isSuccess {
            presenter?.didRetriveHomeInfo(message: "Deu bom! 😃")
        } else {
            presenter?.onError(message: "Deu ruim! 😢")
        }
    }
}
