//
//  ContactListFactory.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 19/11/22.
//

enum ContactListFactory {
    static func build() -> ContactListViewController {
        let interactor = ContactListInteractor()
        let router = ContactListRouter()
        let presenter = ContactListPresenter(interactor: interactor, router: router)
        let viewController = ContactListViewController(presenter: presenter)
        interactor.presenter = presenter
        presenter.view = viewController
        router.viewController = viewController
        return viewController
    }
}
