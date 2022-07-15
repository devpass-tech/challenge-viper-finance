//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ConfirmationViewController: UIViewController {
    let screenView = ConfirmationView()
    private let presenter: ConfirmationPresenterInputProtocol
    
    init(presenter: ConfirmationPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screenView.delegate = self
        view = screenView
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {
    func didTapButton() {
        presenter.didTapNice()
    }
}

extension ConfirmationViewController: ConfirmationPresenterOutputProtocol {
    func dismissConfirmation() {
        dismiss(animated: true, completion: nil)
    }
}

