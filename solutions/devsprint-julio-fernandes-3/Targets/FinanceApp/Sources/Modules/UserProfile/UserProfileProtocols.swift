//
//  UserProfileProtocols.swift
//  FinanceApp
//
//  Created by Mobills on 02/06/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation

struct UserData {
    
    struct PersonalData {
        let label: String
        let content: String
    }
    
    let username: String
    let agency: String
    let account: String
    let bank: String
    let personalData: [PersonalData]
}


protocol UserProfilePresenterProtocol {
    var view: UserProfileViewDelegate? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }
    var router: UserProfileRouterProtocol? { get set }
    
    func viewDidLoad()
}

protocol UserProfileInteractorDelegate: AnyObject {
    func didLoadData(_ userData: UserData)
}

protocol UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate? { get set }

    func fetchData()
}

protocol UserProfileViewControllerProtocol {
    var presenter: UserProfilePresenterProtocol? { get set }
}

protocol UserProfileViewDelegate: AnyObject {
    func update(userData: UserData)
}

protocol UserProfileRouterProtocol {
    
}
