//
//  ActivityDetailsRouter.swift
//  FinanceApp
//
//  Created by Mobills on 25/05/22.
//  Copyright © 2022 tuist.io. All rights reserved.
//

import Foundation
import UIKit

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    var view: UIViewController?
    
    func presentReportIssue() {
        let successAlert = UIAlertController(
            title: "Success!",
            message: "Issue Reported",
            preferredStyle: .alert
        )
        successAlert.addAction(UIAlertAction(title: "OK", style: .default))
        view?.present(successAlert, animated: true)
    }
    
}
