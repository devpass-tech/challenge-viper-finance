//
//  HomePresenter.swift
//  FinanceApp
//
//  Created by rebert.m.teixeira on 01/02/22.
//

import Foundation
import UIKit

protocol HomePresenterDelegate: AnyObject {
    func showSuccess(message: String)
    func showError(message: String)
}

final class HomePresenter: HomePresenterProtocol {
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?
    
    func viewDidLoad() {
        interactor?.didFetchData()
    }
    
    func pushToUserProfile(navigation: UINavigationController) {
        router?.pushToUserProfile(navigation: navigation)
    }
    
    func pushToActivityDetails(navigation: UINavigationController) {
//        router?.pushToActivityDetails(navigation: navigation)
        router?.pushToSampleV2(navigation: navigation)
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didRetriveHomeInfo(message: String) {
        view?.showSuccess(message: message)
    }
    
    func onError(message: String) {
        view?.showError(message: message)
    }
}
