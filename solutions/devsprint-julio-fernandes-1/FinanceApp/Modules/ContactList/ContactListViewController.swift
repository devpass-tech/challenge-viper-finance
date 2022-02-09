//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ContactListViewController: UIViewController {
	
	var presenter: ContactListPresenterProtocol
	
	init(presenter: ContactListPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = ContactListView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad()
	}
}

extension ContactListViewController: ContactListPresenterDelegate {
    func showData(_ contactList: [ContactEntity]) {
        //Setup contact list
    }
}
