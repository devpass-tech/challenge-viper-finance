//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol ContactListViewDelegate: AnyObject {
    func didSelectContact()
}

class ContactListView: UIView {
    static let cellSize = CGFloat(82)
    private let cellIdentifier = "ContactCellIdentifier"
    weak var delegate: ContactListViewDelegate?
    var viewController: ContactListViewControllerProtocol?
    
    var contactList: [ContactEntity] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private(set) lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init() {
        super.init(frame: .zero)

        backgroundColor = .white
        addSubviews()
        configureConstraints()
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

// MARK: UITableViewDataSource
extension ContactListView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController?.numberOfRowsInSection() ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContactCellView else {
            return UITableViewCell()
        }
        
        cell.contactNameLabel.text = viewController?.getContactNameLabel(index: indexPath.row)
        cell.contactPhoneLabel.text = viewController?.getcContactPhoneLabel(index: indexPath.row)

        return cell
    }
}

// MARK: UITableViewDelegate
extension ContactListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectContact()
    }
}

// MARK: ContactListViewDelegate
extension ContactListView: ContactListViewDelegate {
    func didSelectContact() {
        delegate?.didSelectContact()
    }
}
