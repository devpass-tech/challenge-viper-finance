//
//  ActivityDetailsPresenter.swift
//  FinanceApp
//
//  Created by Douglas Cardoso Ferreira on 31/01/22.
//

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func didReportIssue()
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol?
    var router: ActivityDetailsRouterProtocol?
    
    private var activityDetails: ActivityDetailsEntity?
    
    func viewDidLoad() {
        interactor?.fetchData()
    }
    
    func reportIssue() {
        interactor?.reportIssue()
    }
    
    func getName() -> String {
        return self.activityDetails?.name ?? ""
    }
    
    func getCategory() -> String {
        return self.activityDetails?.category ?? ""
    }
    
    func getPrice() -> String {
        return "R$\(self.activityDetails?.price ?? 0.0)"
    }
    
    func getTime() -> String {
        return self.activityDetails?.time ?? ""
    }
    
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    func didReportIssue() {
        view?.didReportIssue()
    }
    
    func didFetchData(_ activity: ActivityDetailsEntity?) {
        self.activityDetails = activity
    }
}
