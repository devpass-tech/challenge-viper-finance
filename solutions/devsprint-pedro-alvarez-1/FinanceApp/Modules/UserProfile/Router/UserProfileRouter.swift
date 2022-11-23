//
//  UserProfileRouter.swift
//  FinanceApp
//
//  Created by Rodrigo Lemos on 22/11/22.
//

import Foundation

protocol UserProfileRouterInput {
    func createModule()
}

final class UserProfileRouter: UserProfileRouterInput {
    
    weak var view: UserProfileViewController?
    
    func createModule() {
        
    }
    
    func navigate() {
        
    }
}
