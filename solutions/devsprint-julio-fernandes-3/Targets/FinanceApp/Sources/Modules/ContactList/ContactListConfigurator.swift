//
//  ContactListConfigurator.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 30/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import UIKit

final class ContactListConfigurator: ContactListConfiguratorProtocol {
    static func createModule() -> UIViewController {
        let view = ContactListViewController()
        let presenter = ContactListPresenter()
        let interactor = ContactListInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        
        return view
    }
}
