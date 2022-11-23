//
//  UserProfilePresenter.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import UIKit

protocol UserProfilePresenterInput {
    func viewWillAppear()
    func setupTableViewProtocols(_ tableView: UITableView)
}

protocol UserProfilePresenterOutput: AnyObject {
    func updateUI(userProfileViewModel: UserProfileViewModel)
}

final class UserProfilePresenter: NSObject {

    weak var view: UserProfilePresenterOutput?
    private let interactor: UserProfileInteractorInput
    private let router: UserProfileRouterInput

    private var userProfileViewModel: UserProfileViewModel? {
        didSet {
            guard let userProfileViewModel = userProfileViewModel else { return }
            view?.updateUI(userProfileViewModel: userProfileViewModel)
        }
    }

    init(interactor: UserProfileInteractorInput, router: UserProfileRouterInput) {
        self.interactor = interactor
        self.router = router
    }
}

extension UserProfilePresenter: UserProfilePresenterInput {

    func viewWillAppear() {
        interactor.fetchUserProfile()
    }

    func setupTableViewProtocols(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
    }
}


extension UserProfilePresenter: UserProfileInteractorOutput {

    func didFetchUserProfile(_ userProfile: UserProfile?) {
        guard let userProfile = userProfile else { return }
        userProfileViewModel = UserProfileViewModel(name: userProfile.name,
                                                    phone: userProfile.phone,
                                                    email: userProfile.email,
                                                    address: userProfile.address,
                                                    account: userProfile.account)
    }
}

extension UserProfilePresenter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = userProfileViewModel?.phone
        case 1:
            cell.textLabel?.text = "E-mail"
            cell.detailTextLabel?.text = userProfileViewModel?.email
        case 2:
            cell.textLabel?.text = "Address"
            cell.detailTextLabel?.text = userProfileViewModel?.address
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My account"
    }
}

extension UserProfilePresenter: UITableViewDelegate {

}



