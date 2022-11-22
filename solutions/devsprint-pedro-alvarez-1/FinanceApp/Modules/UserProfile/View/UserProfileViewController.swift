//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {

    private let presenter: UserProfilePresenterInput

    init(presenter: UserProfilePresenterInput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = UserProfileView()
    }
}

extension UserProfileViewController: UserProfilePresenterOutput {

}
