//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

protocol ConfirmationViewControllerProtocol {
    func getText() -> String
    func getColorIcon() -> UIColor
    func getButtonTitle() -> String
    func dismissThisScreen()
}

final class ConfirmationViewController: UIViewController, ConfirmationViewControllerProtocol {
    
    var presenter: ConfirmationPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = ConfirmationView(viewController: self)
    }
    
    func getText() -> String {
        presenter?.getText() ?? ""
    }
    
    func getColorIcon() -> UIColor {
        presenter?.getColorIcon() ?? .systemBlue
    }
    
    func getButtonTitle() -> String {
        presenter?.getButtonTitle() ?? ""
    }
    
    func dismissThisScreen() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension ConfirmationViewController: ConfirmationPresenterDelegate {

}
