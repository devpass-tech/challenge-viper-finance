//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    private let presenter: UserProfilePresenterInput
    private lazy var userProfileView = UserProfileView()

    init(presenter: UserProfilePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = userProfileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setupTableViewProtocols(userProfileView.tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension UserProfileViewController: UserProfilePresenterOutput {
    
    func updateUI(userProfileViewModel: UserProfileViewModel) {
        DispatchQueue.main.async {
            self.userProfileView.tableView.reloadData()
            self.userProfileView.userProfileHederView.setupContent(userProfileViewModel: userProfileViewModel)
        }
    }
}
