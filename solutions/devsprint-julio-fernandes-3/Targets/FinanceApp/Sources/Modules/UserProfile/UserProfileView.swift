//
//  UserProfileView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

final class UserProfileView: UIView {

    private var headerView = UserProfileHeaderView()
    private var userData: UserData?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self

        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        tableView.tableHeaderView = headerView
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white

        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserProfileView: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return userData?.personalData.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = userData?.personalData[indexPath.row].label
        cell.detailTextLabel?.text = userData?.personalData[indexPath.row].content
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My account"
    }
    
    func update(userData: UserData) {
        self.userData = userData
        headerView.nameLabel.text = userData.username
        headerView.agencyLabel.text = userData.agency
        headerView.accountLabel.text = userData.account
        headerView.bankLabel.text = userData.bank
        tableView.reloadData()
    }
}


