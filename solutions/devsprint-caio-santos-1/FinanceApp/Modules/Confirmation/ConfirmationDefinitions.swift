//
//  ConfirmationDefinitions.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 09/02/22.
//

import Foundation

public struct ConfirmationTransporter {
    let success: Bool
    
    init(success: Bool) {
        self.success = success
    }
}
