//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

// MARK: - HomeViewController

final class HomeViewController: UIViewController {

    // MARK: Public Properties

    var presenter: HomePresenterProtocol?

    // MARK: Private Properties
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()

    // MARK: LifeCycle

    override func loadView() {
        self.view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setUpView()
    }

    // MARK: Private Methods

    @objc
    private func openProfile() {
        let navigationController = UINavigationController(rootViewController: UserProfileViewController())
        self.present(navigationController, animated: true)
    }
    
    private func setUpView() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        let activityDetailsViewController = ActivityDetailsRouter.createModule()
        self.navigationController?.pushViewController(activityDetailsViewController, animated: true)
    }
}

// MARK: - HomePresenterDelegate

extension HomeViewController: HomePresenterDelegate {
    func showError(message: String) {
        showAlertError(message: message)
    }
    
    func showData(homeData: HomeData) {
        homeView.setupWithHomeData(homeData)
    }
}
