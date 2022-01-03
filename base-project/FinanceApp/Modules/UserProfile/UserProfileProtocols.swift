//
//  UserProfileProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol UserProfilePresenterProtocol {

    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }
    var router: UserProfileRouterProtocol? { get set }
}

protocol UserProfileRouterProtocol {

    static func createModule() -> UIViewController
}

protocol UserProfileInteractorProtocol {

    var presenter: UserProfileInteractorDelegate? { get set }
}


