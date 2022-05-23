//
//  SampleProtocols.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation
import UIKit

protocol SamplePresenterProtocol {

    var view: SamplePresenterDelegate? { get set }
    var interactor: SampleInteractorProtocol? { get set }
    var router: SampleRouterProtocol? { get set }

    func viewDidLoad()
}

protocol SampleRouterProtocol {

    static func createModule() -> UINavigationController
    func navigateToNewModule()
}

protocol SampleInteractorProtocol {

    var presenter: SampleInteractorDelegate? { get set }
    func fetchData()
}


