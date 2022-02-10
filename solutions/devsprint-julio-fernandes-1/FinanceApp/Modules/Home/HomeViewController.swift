//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Properties
    var presenter: HomePresenterProtocol
    
    // MARK: Components
    lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    // MARK: Init
    init(presenter: HomePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        presenter.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }

    override func loadView() {
        self.view = homeView
    }
    
    // MARK: Methods
    @objc
    func openProfile() {
        presenter.navigateToUserProfile()
    }
}

// MARK: Extensions
extension HomeViewController: HomeViewDelegate {
    func didSelectActivity() {
        presenter.navigateToActivity()
    }
}

extension HomeViewController: HomePresenterDelegate {
    func showData() {
        print("HomeViewController - HomePresenterDelegate - showData()")
    }
}
