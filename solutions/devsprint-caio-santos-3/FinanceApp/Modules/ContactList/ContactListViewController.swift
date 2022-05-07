//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
    
    private var contactList: [ContactListEntity] = []
    var presenter: ContactListPresenterProtocol
    
    //MARK: Var
    
    private lazy var contactTableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ContactCellView.self, forCellReuseIdentifier: ContactCellView.cellIdentifier)
        return tableView
    }()
    
    //MARK: Init
    
    init(presenter: ContactListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        contactTableView.dataSource = self
        contactTableView.delegate = self
        contactTableView.backgroundColor = .white
        addSubviews()
        configureConstraints()

        contactTableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.viewDidLoad()
    }
    
    func addSubviews() {

        view.addSubview(contactTableView)
    }
    
    func configureConstraints() {

        NSLayoutConstraint.activate([

            contactTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contactTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contactTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: TableView DataSource

extension ContactListViewController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return contactList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactCellView.cellIdentifier, for: indexPath) as? ContactCellView else {
            return UITableViewCell()
        }
        let contacts = contactList[indexPath.row]
        cell.setupLabels(contacts: contacts)
        return cell
    }
}

//MARK: TableView Delegate

extension ContactListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ContactCellView.cellSize
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension ContactListViewController: ContactListPresenterDelegate {

    func showData(_ contactList: [ContactListEntity]) {
        self.contactList = contactList
    }
}
