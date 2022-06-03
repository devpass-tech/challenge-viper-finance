//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

final class ContactListView: UIView {
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.cellIdentifier)
        return tableView
    }()

    init(tableViewDataSource: UITableViewDataSource, tableViewDelegate: UITableViewDelegate) {
        super.init(frame: .zero)

        backgroundColor = .white
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        
        addSubviews()
        configureConstraints()
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        return nil
    }
}

extension ContactListView {
    func addSubviews() {
        addSubview(tableView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
