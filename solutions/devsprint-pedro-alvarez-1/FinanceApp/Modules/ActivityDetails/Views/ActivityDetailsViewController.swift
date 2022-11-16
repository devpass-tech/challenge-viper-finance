//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {
    private let presenter: ActivityDetailsPresenterIntput
    
    init(presenter: ActivityDetailsPresenterIntput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = ActivityDetailsView()
        presenter.fetchActivityDetails()
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterOutput {
    func showActivityDetails(_ data: ActivityDetails) {
        // TODO: implement in the next PR
        print("Data ViewController: \(data)")
    }
}
