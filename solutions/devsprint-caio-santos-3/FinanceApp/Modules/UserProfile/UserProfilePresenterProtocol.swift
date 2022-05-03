//
//  UserProfilePresenterProtocol.swift
//  FinanceApp
//
//  Created by Alexandre Cardoso on 27/04/22.
//

import UIKit

// MARK: - typealias Presenter
typealias UserProfilePresentable = UserProfilePresenterProtocol & UserProfileInteractorDelegate

// MARK: - Protocols Presenter
protocol UserProfilePresenterProtocol {
    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }

    func viewDidLoad()
    func getUserProfileCell(indexPath: IndexPath) -> AccountCell?
}

protocol UserProfilePresenterDelegate: AnyObject {
    func showData(with user: UserEntity)
}

// MARK: - Protocols Interactor
protocol UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate? { get set }

    func fetchData()
}

protocol UserProfileInteractorDelegate: AnyObject {
    func didFetchData(_ user: UserEntity)
    func didErrorData(error: FinanceServiceError)
}

// MARK: - Protocol Factory
protocol ModuleFactory {
    func createModule() -> UIViewController
}

// MARK: - Protocol Views
protocol UserProfileViewDelegate: AnyObject {
    func getUserProfileCell(indexPath: IndexPath) -> AccountCell?
}

protocol UserProfileHeaderViewProtocol {
    var name: String { get }
    var agency: String { get }
    var account: String { get }
    var bank: String { get }
}
