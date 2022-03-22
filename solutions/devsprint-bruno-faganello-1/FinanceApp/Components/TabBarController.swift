//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {

        let homeViewController = HomeRouter.createModule()
        let homeNavigationController = UINavigationController(rootViewController: homeViewController)
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeNavigationController.tabBarItem = homeTabBar

        let transfersNavigationController = TransferRouter.createModule()
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersNavigationController.tabBarItem = transfersTabBar

        self.viewControllers = [homeNavigationController, transfersNavigationController]
    }
}
