//
//  SampleV2Router.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import UIKit

final class SampleV2Router {
        
    // MARK: - VIPER Properties
    
    weak var viewController: UIViewController?
}

// MARK: - Router Protocol
extension SampleV2Router: SampleV2RouterProtocol {
    func navigateToViewXPTO() {
        let viewControllerToNavigateTo = SampleViewController()
        self.viewController?.navigationController?.present(viewControllerToNavigateTo, animated: true)
    }
}
