//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    var presenter: UserProfilePresenterProtocol?

    override func loadView() {
        self.view = UserProfileView()
    }
}

extension UserProfileViewController: UserProfilePresenterDelegate {

}
