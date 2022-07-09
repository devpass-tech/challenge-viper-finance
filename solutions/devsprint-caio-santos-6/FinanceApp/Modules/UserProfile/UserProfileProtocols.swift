//
//  UserProfileProtocols.swift
//  FinanceApp
//
//  Created by Caio Santos on 05/07/22.
//

import Foundation
import UIKit

protocol UserProfilePresenterProtocol {
    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }
    var router: UserProfileRouterProtocol? { get set }

    func viewDidLoad() // 1: --> Pedir os dados para Interactor
    func showSelectedValue(index: Int) -> String? // Ex.: Você tocou no item {LABEL} cujo valor é {VALUE}
    func numberOfSections() -> Int
    func numberOfRows(at section: Int) -> Int
    func titleForHeaderInSection(_ section: Int) -> String
    func getLabelValue(at indexPath: IndexPath) -> (label: String, value: String)
}

protocol UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate? { get set }
    func fetchData() // 2: --> Consumir dados do serviço (API) ->> UrlSession
}

protocol UserProfileInteractorDelegate: AnyObject {
    func didFetchData(user: User, accountInfos: [AccountData]) // 3: --> Volta pra presenter o dado
    func didFetchDataWithError() // 3: --> Volta pra presenter que deu erro
}

protocol UserProfilePresenterDelegate: AnyObject {
    func showData()  // 4: Reload data da tableview
    func showError() // 4: Mostra estado de erro
}

protocol UserProfileRouterProtocol {
    static func createModule() -> UIViewController
}

protocol UserProfileViewControllerProtocol {
    func numberOfSections() -> Int
    func numberOfRows(at section: Int) -> Int
    func getLabelValue(at indexPath: IndexPath) -> (label: String, value: String)
}

