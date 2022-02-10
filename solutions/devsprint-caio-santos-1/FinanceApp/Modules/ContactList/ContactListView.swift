//
//  ContactListView.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ContactListViewDelegate: AnyObject {
    func didSelectContactButton()
}

final class ContactListView: UIView {
    weak var delegate: ContactListViewDelegate?
    var viewController: ContactListViewControllerProtocol?
    
    var contactList: ContactListEntity = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    static let cellSize = CGFloat(82)

    private let cellIdentifier = "ContactCellIdentifier"

    lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: self.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    init(viewController: ContactListViewControllerProtocol) {
        super.init(frame: .zero)

        self.viewController = viewController
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

extension ContactListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  viewController?.numberOfRowsInSection() ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactCellView
        cell.contactNameLabel.text = viewController?.getNameLabel(at: indexPath.row)
        cell.contactPhoneLabel.text = viewController?.getPhoneLabel(at: indexPath.row)

        return cell
    }
}

extension ContactListView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactListView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.didSelectContactButton()
    }
}

extension ContactListView: ContactListViewDelegate {
    func didSelectContactButton() {
        delegate?.didSelectContactButton()
    }
}
