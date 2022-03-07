//
//  ConfirmationProtocols.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
import UIKit

protocol ConfirmationPresenterProtocol {
    var view: ConfirmationPresenterDelegate? { get set }
    var router: ConfirmationRouterProtocol { get set }
    var confirmation: ConfirmationEntity { get set }

    func viewDidLoad()
}

protocol ConfirmationRouterProtocol {
    static func createModule(confirmation: ConfirmationEntity) -> UIViewController
}

protocol ConfirmationInteractorProtocol {
    func fetchData()
}
