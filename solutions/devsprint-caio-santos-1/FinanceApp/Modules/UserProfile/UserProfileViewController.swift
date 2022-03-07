//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol UserProfileViewControllerProtocol {
    func viewDidLoad()
    func getUserName() -> String
    func getAgency() -> String
    func getAccount() -> String
    func getBank() -> String
    func getPhone() -> String
    func getEmail() -> String
    func getAddress() -> String
    func numberOfSections() -> Int
    func numberOfRows() -> Int
}

final class UserProfileViewController: UIViewController {
    var presenter: UserProfilePresenterProtocol?
    var userProfile: UserProfileEntity?
    
    lazy var userProfileView: UserProfileView = {
        let userProfileView = UserProfileView(viewController: self)
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
    func showData(with userProfile: UserProfileEntity) {
        self.userProfile = userProfile
    }
}

extension UserProfileViewController: UserProfileViewControllerProtocol {
    func getUserName() -> String {
        return presenter?.getUserName() ?? ""
    }
    
    func getAgency() -> String {
        return presenter?.getAgency() ?? ""
    }
    
    func getAccount() -> String {
        return presenter?.getAccount() ?? ""
    }
    
    func getBank() -> String {
        return presenter?.getBank() ?? ""
    }
    
    func getPhone() -> String {
        return presenter?.getPhone() ?? ""
    }
    
    func getEmail() -> String {
        return presenter?.getEmail() ?? ""
    }
    
    func getAddress() -> String {
        return presenter?.getAddress() ?? ""
    }
    
    func numberOfSections() -> Int {
        return presenter?.numberOfSections() ?? 0
    }
    
    func numberOfRows() -> Int {
        return presenter?.numberOfRows() ?? 0
    }    
}
