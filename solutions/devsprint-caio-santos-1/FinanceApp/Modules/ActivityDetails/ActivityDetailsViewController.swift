//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {
    
    var presenter: ActivityDetailsPresenterProtocol?
    
    var activity: ActivityDetailsEntity? {
        didSet {
            self.activityDetailsView.setupView(activity: self.activity)
        }
    }
    
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
    
    private func showAlert(title: String, message: String) {
        let alert = AlertView.showAlert(title: title , message: message)
        self.present(alert, animated: true, completion: nil)
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func showData(activity: ActivityDetailsEntity) {
        self.activity = activity
    }
    
    func didReportIssue() {
        showAlert(title: "Issue Reported!", message: "Your issue has been reported successfully!")
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func reportIssue() {
        presenter?.reportIssue()
    }
}
