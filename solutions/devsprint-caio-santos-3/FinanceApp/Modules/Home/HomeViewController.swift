//
//  HomeViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?
    
    lazy var homeView: HomeView = {
        
        let homeView = HomeView()
        homeView.delegate = self
        return homeView
    }()
    
    init(presenter: HomePresenterProtocol){
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(openProfile))
    }
    
    override func loadView() {
        self.view = homeView
    }
    
    @objc
    func openProfile() {
        presenter?.presentUserProfile()
    }
}

extension HomeViewController: HomeViewDelegate {
    
    func didSelectActivity() {
        presenter?.pushToActivityDetails()
    }
}

extension HomeViewController: HomePresenterDelegate {
    
    func showData() {
        print("Here is your data, View!")
    }
}
