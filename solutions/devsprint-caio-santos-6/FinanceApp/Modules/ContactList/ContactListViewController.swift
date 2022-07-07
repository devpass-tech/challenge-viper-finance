//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ContactListViewController: UIViewController {
	static let cellSize = CGFloat(82)

	private let cellIdentifier = "ContactCellIdentifier"
	
	var presenter: ContactListPresenterProtocol?

	lazy var tableView: UITableView = {

		let tableView = UITableView(frame: .zero)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(ContactCellView.self, forCellReuseIdentifier: self.cellIdentifier)
		tableView.dataSource = self
		tableView.delegate = self
		return tableView
	}()
    
	override func viewDidLoad() {
		view.backgroundColor = .white
		addSubviews()
		configureConstraints()

		tableView.reloadData()
	}
	
}

extension ContactListViewController {

	func addSubviews() {

		view.addSubview(tableView)
	}

	func configureConstraints() {

		NSLayoutConstraint.activate([

			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}

extension ContactListViewController: UITableViewDataSource {

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		presenter?.numberOfRowsInSection() ?? .zero
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ContactCellView

		return cell
	}
}

extension ContactListViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Self.cellSize
	}

	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

	}
}

extension ContactListViewController: ContactListPresenterDelegate {
	
}
