//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        let homeViewController: UIViewController = HomeRouter.createModule()
        let homeNavigationController: UINavigationController = UINavigationController(rootViewController: homeViewController)
        let homeTabBar: UITabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeNavigationController.tabBarItem = homeTabBar

        let transfersNavigationViewController = TransfersRouter.createModule()
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersNavigationViewController.tabBarItem = transfersTabBar

        self.viewControllers = [homeNavigationController, transfersNavigationViewController]
    }
}
