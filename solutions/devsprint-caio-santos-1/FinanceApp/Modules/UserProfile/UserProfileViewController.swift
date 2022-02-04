//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileViewController: UIViewController {
    var presenter: UserProfilePresenterProtocol?
    
    lazy var userProfileView: UserProfileView = {
        let userProfileView = UserProfileView()
        return userProfileView
    }()

    override func loadView() {
        self.view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension UserProfileViewController: UserProfilePresenterDelegate {
    func showData() {
        print("Here is your data, User Profile View!")
    }
}
