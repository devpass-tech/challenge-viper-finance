//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Junior Fernandes on 16/11/22.
//

import Foundation

protocol ActivityDetailsPresenterIntput {
    func viewDidLoad()
    var viewModel: ActivityDetailsViewModel? { get }
}

protocol ActivityDetailsPresenterOutput: AnyObject {
    func updateView()
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterIntput {
    private let interactor: ActivityDetailsInteractorInput
    private let router: ActivityDetailsRouterInput
    weak var view: ActivityDetailsPresenterOutput?
    private(set) var viewModel: ActivityDetailsViewModel? {
        didSet {
            view?.updateView()
        }
    }
    
    init(interactor: ActivityDetailsInteractorInput,
         router: ActivityDetailsRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchDetails()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorOutput {
    func didFetchDetail(_ data: ActivityDetailsEntity) {
        viewModel = .init(entity: data)
    }
}
