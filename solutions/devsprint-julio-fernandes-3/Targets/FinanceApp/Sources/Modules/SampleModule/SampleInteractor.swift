//
//  SampleInteractor.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol SampleInteractorDelegate: AnyObject {

    func didFetchData()
}

class SampleInteractor: SampleInteractorProtocol {

    weak var presenter: SampleInteractorDelegate?

    func fetchData() {

        presenter?.didFetchData()
    }
}
