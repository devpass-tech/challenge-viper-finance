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
        
        // Essa tela de Report Issue não existe, entao crie so essa view controlller para representar
        let reportIssueViewController = UIViewController()
        reportIssueViewController.view.backgroundColor = .white
        let reportIssueNavigationController = UINavigationController(
            rootViewController: reportIssueViewController
        )
        view?.present(reportIssueNavigationController, animated: true)
    }
    
}
