//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileViewController: UIViewController, UserProfileViewControllerProtocol {
    
    var presenter: UserProfilePresenterProtocol?
    private lazy var profileView = UserProfileView()
    
    override func loadView() {
        super.loadView()
        self.view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension UserProfileViewController: UserProfileViewDelegate {    
    func update(userData: UserData) {
        profileView.update(userData: userData)
    }
}
