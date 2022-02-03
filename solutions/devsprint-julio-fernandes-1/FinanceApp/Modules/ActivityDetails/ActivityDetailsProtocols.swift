//
//  ActivityDetailsProtocols.swift
//  FinanceApp
//
//  Created by Sara Batista dos Santos Felix (P) on 01/02/22.
//
import UIKit

protocol ActivityDetailsPresenterProtocol {
    
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol? {get set}
    var router: ActivityDetailsRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol ActivityDetailsRouterProtocol {
    
    static func createModule() -> UIViewController
}

protocol ActivityDetailsInteractorProtocol {
    
    var presenter: ActivityDetailsInteractorDelegate? { get set }
    
    func fetchData()
}
