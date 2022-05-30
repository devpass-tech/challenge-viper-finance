//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?

    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    override func viewDidLoad() {
        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = homeView
    }
}

extension HomeViewController: HomeViewDelegate {

    func didSelectActivity() {
        presenter?.openActivityDetails()
    }
}

extension HomeViewController: HomePresenterDelegate {
    func setupNavigationItem(_ item: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = item
    }
    
    func reloadData() {
        print("reload data")
    }
}
