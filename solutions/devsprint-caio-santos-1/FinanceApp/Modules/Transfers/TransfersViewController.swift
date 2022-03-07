//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
    
    
    // MARK: - VIPER Properties
    private let presenter: TransfersPresenterInputProtocol?

    // MARK: - Internal Properties
    lazy var transferView: TransfersView = {

        let transferView = TransfersView(viewController: self)
        return transferView
    }()

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(presenter: TransfersPresenterInputProtocol) {
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
        self.view = transferView
    }
}

extension TransfersViewController: TransfersViewControllerInputProtocol {
    
    // MARK: Methods
    func didTapContactButton() {
        presenter?.navigateToContactView()
    }
    
    func didTapConfirmationButton(value: String) {
        presenter?.createTransfer(value: value)
    }
}
