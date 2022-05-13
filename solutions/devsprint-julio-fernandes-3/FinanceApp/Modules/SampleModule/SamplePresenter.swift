//
//  SamplePresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol SamplePresenterDelegate: AnyObject {

    func showData()
}

class SamplePresenter: SamplePresenterProtocol {

    weak var view: SamplePresenterDelegate?
    var interactor: SampleInteractorProtocol?
    var router: SampleRouterProtocol?

    func viewDidLoad() {

        interactor?.fetchData()
    }
}

extension SamplePresenter: SampleInteractorDelegate {

    func didFetchData() {

        view?.showData()
    }
}
