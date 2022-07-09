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
		presenter?.viewDidLoad()
	}
}

extension ContactListViewController {

	func addSubviews() {
		view.addSubview(tableView)
	}

	func configureConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
}

extension ContactListViewController: UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter?.numberOfRowsInSection() ?? .zero
	}

	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ContactCellView,
			let dto = presenter?.getDTOforCell(at: indexPath)
		else { return .init(frame: .zero)}
		cell.setup(with: dto)
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
	func showError(message: String) {
		let alert = UIAlertController(title: "Ops..", message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Tente de novo", style: .default) { [weak self] _ in
			self?.presenter?.viewDidLoad()
		}
		alert.addAction(action)
		present(alert, animated: true)
	}

	func updateView() {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadData()
		}
	}
}
