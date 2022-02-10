//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

//protocol ActivityDetailsViewControllerDelegate {
//    func refreshData()
//}

final class ActivityDetailsViewController: UIViewController {
    
    var presenter: ActivityDetailsPresenterProtocol?
    
    lazy var activityDetailsView: ActivityDetailsView = {
        let view: ActivityDetailsView = ActivityDetailsView(viewController: self)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = activityDetailsView
    }
    
    private func showAlert(title: String, message: String) {
        let alert = AlertView.showAlert(title: title , message: message)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func didReportIssue() {
        showAlert(title: "Issue Reported!", message: "Your issue has been reported successfully!")
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func reportIssue() {
        presenter?.reportIssue()
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewControllerProtocol {
    func getName() -> String {
        return presenter?.getName() ?? ""
    }
    
    func getCategory() -> String {
        return presenter?.getCategory() ?? ""
    }
    
    func getPrice() -> String {
        return presenter?.getPrice() ?? ""
    }
    
    func getTime() -> String {
        return presenter?.getTime() ?? ""
    }
}
