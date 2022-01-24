//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?

    override func loadView() {
        self.view = HomeView()
    }
}

extension HomeViewController: HomePresenterDelegate {

}
