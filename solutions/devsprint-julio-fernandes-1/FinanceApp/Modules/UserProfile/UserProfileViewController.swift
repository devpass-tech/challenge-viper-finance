//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileViewController: UIViewController {
	
	var presenter: UserProfilePresenterProtocol
	
	init(presenter: UserProfilePresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = UserProfileView()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad()
	}
	
}

extension UserProfileViewController: UserProfilePresenterDelegate {
	
	func showData() {
	}
	
}
