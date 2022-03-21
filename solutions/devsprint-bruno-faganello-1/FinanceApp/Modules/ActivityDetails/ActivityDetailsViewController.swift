//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ActivityDetailsViewController: UIViewController {

    // MARK: Public Properties

    var presenter: ActivityDetailsPresenterProtocol?
    
    // MARK: - Private Properties

    private lazy var contentView = ActivityDetailsView()
    
    // MARK: UIViewController LifeCycle

    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

// MARK: - ActivityDetailsPresenterDelegate

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    func showData(_ activity: Activity) {
        contentView.setupWithActivity(activity)
    }
    
    func showError(message: String) {
        showAlertError(message: message)
    }
}
