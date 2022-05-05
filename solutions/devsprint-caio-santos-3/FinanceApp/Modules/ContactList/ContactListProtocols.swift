//
//  ContactListProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Francischett Occhiuto on 26/04/22.
//

import Foundation
import UIKit

protocol ContactListPresenterProtocol {

    var view: ContactListPresenterDelegate? { get set }

    func viewDidLoad()
}

protocol ContactListRouterProtocol {

    static func createModule() -> UIViewController
    func navigateToNewModule()
}

protocol ContactListInteractorProtocol {

    var presenter: ContactListInteractorDelegate? { get set }
    func fetchData()
}

//Mark: Delegate Protocols

protocol ContactListPresenterDelegate: AnyObject {

    func showData(_ contactList: [ContactListEntity])
}

protocol ContactListInteractorDelegate: AnyObject {

    func didFetchData(contactList: [ContactListEntity])
}
