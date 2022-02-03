//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    var presenter: ActivityDetailsPresenterProtocol?
    
    lazy var activityDetailsView: ActivityDetailsView = {
        let view: ActivityDetailsView = ActivityDetailsView()
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
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func showData() {
        print("Here is your data, ActivityDetailsViewController")
    }
    
    func didReportIssue() {
        presenter?.alert(title: "Issue Reported!", message: "Your issue has been reported successfully!", viewController: self)
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func reportIssue() {
        presenter?.reportIssue()
    }
}
