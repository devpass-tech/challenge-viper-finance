//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class UserProfileViewController: UIViewController {
    
    private var presenter: UserProfilePresenterProtocol
    
    init(presenter: UserProfilePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let userProfileView = UserProfileView()
        userProfileView.delegate = self
        self.view = userProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
}

extension UserProfileViewController: UserProfilePresenterDelegate {
    
    func showData(with user: UserEntity) {
        DispatchQueue.main.async {
            if let view = self.view as? UserProfileView {
                let viewData = UserProfileHeaderViewData(user: user)
                view.updateHeaderView(user: viewData)
                view.reloadTableView()
            }
        }
    }
    
}

extension UserProfileViewController: UserProfileViewDelegate {
    
    func getUserProfileCell(indexPath: IndexPath) -> AccountCell? {
        return presenter.getUserProfileCell(indexPath: indexPath)
    }
    
}
