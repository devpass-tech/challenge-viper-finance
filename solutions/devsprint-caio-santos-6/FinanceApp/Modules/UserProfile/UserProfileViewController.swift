//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    var presenter: UserProfilePresenterProtocol?

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self

        let headerView = UserProfileHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: 0, height: 232)
        tableView.tableHeaderView = headerView
        return tableView
    }()
    
    override func viewDidLoad() {
        setupView()
        presenter?.viewDidLoad()
    }
}

// MARK: - Private Methods

extension UserProfileViewController {
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension UserProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.numberOfSections() ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows(at: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = presenter?.getLabelValue(at: indexPath) else {
            return UITableViewCell()
        }

        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = data.label
        cell.detailTextLabel?.text = data.value

//        switch indexPath.row {
//        case 0:
//
//            cell.textLabel?.text = "Phone"
//            cell.detailTextLabel?.text = "+55 (11) 99999-9999"
//        case 1:
//
//            cell.textLabel?.text = "E-mail"
//            cell.detailTextLabel?.text = "user@devpass.com"
//        case 2:
//
//            cell.textLabel?.text = "Address"
//            cell.detailTextLabel?.text = "Rua Bela Cintra, 495"
//        default:
//            break
//        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "My account"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let message = presenter?.showSelectedValue(index: indexPath.row) else {
            return
        }

        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UserProfilePresenterDelegate
extension UserProfileViewController: UserProfilePresenterDelegate {
    func showData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.isHidden = true
        }
    }
}
