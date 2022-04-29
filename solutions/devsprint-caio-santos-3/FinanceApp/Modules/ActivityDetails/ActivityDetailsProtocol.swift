//
//  ActivityDetailsProtocol.swift
//  FinanceApp
//
//  Created by Bruno Vieira Souza on 26/04/22.
//

import Foundation
import UIKit

protocol ActivityDetailsPresenterProtocol {
    
    var view: ActivityDetailsPresenterDelegate? { get set }

    func viewDidLoad()
}

protocol ActivityDetailsRouterProtocol {
    var viewController: UIViewController?  { get set }
    
    static func createModule() -> UIViewController
    func navigateToNewModule()

}

protocol ActivityDetailsInteractorProtocol {

    var presenter: ActivityDetailsInteractorDelegate? { get set }
    func fetchData()
}
