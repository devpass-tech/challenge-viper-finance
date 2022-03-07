//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol UserProfileViewDelegate: AnyObject {
    func didSelectContactButton()
}

final class UserProfileView: UIView {
    
    weak var delegate: UserProfileViewDelegate?
    var viewController: UserProfileViewControllerProtocol?
    
    var userProfile: UserProfileEntity = UserProfileEntity(name: "",
                                                           phone: "",
                                                           email: "",
                                                           address: "",
                                                           account: AccountEntity(agency: "",
                                                                                  account: "",
                                                                                  bank: "")) {
        didSet {
            tableView.reloadData()
        }
    }

    private func setupHeaderView(_ tableView: UITableView) {
        let headerView = UserProfileHeaderView(userName: viewController?.getUserName() ?? "",
                                               agency: viewController?.getAgency() ?? "",
                                               account: viewController?.getAccount() ?? "",
                                               bank: viewController?.getBank() ?? "")
        
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 242)
        tableView.tableHeaderView = headerView
    }
    
    var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    init(viewController: UserProfileViewControllerProtocol) {
        super.init(frame: .zero)
        self.viewController = viewController
        

        backgroundColor = .white

        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        tableView.dataSource = self
        setupHeaderView(tableView)
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return viewController?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewController?.numberOfRows() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        setupHeaderView(tableView)
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")

        switch indexPath.row {
        case 0:

            cell.textLabel?.text = "Phone"
            cell.detailTextLabel?.text = viewController?.getPhone() ?? ""
        case 1:

            cell.textLabel?.text = "E-mail"
            cell.detailTextLabel?.text = viewController?.getEmail() ?? ""
        case 2:

            cell.textLabel?.text = "Address"
            cell.detailTextLabel?.text = viewController?.getAddress() ?? ""
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My account"
    }

}
