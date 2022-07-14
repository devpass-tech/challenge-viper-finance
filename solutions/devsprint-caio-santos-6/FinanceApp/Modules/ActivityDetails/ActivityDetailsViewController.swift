//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {
    let screenView = ActivityDetailsView()
    private let presenter: ActivityDetailsPresenterInputProtocol

    override func loadView() {
        view = screenView
        screenView.delegate = self
    }
    
    init(presenter: ActivityDetailsPresenterInputProtocol) {
       self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterOutputProtocol {
    func showReportAlert() {
        let alert = UIAlertController(title: "Alert", message: "Report Issue", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewOutput {
    func didTapButton() {
        presenter.didTapReport()
    }
}
