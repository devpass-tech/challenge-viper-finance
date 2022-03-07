//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    
    // MARK: - VIPER Properties
    private var presenter: ConfirmationPresenterInputProtocol? = nil
    
    // MARK: - Internal Properties
    lazy var confirmationView: ConfirmationView = {
        
        let confirmationView = ConfirmationView(viewController: self)
        return confirmationView
    }()
    
    // MARK: - Inits
    
    init(presenter: ConfirmationPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = confirmationView
    }

}

extension ConfirmationViewController: ConfirmationViewControllerInputProtocol {
    
    func getText() -> String {
        presenter?.getText() ?? ""
    }

    func getColorIcon() -> UIColor {
        presenter?.getColorIcon() ?? .systemBlue
    }

    func getButtonTitle() -> String {
        presenter?.getButtonTitle() ?? ""
    }
    
    func didTapConfirmationButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
