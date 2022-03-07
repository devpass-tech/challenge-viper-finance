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
        let view: ActivityDetailsView = ActivityDetailsView(viewController: self)
        view.delegate = self
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        presenter?.viewDidLoad()
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
