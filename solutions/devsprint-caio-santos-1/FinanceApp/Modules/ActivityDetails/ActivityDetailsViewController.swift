//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {

    var presenter: ActivityDetailsPresenterProtocol?

    override func loadView() {
        self.view = ActivityDetailsView()
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {

}
