//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    var presenter: ConfirmationPresenterProtocol
    private(set) var confirmationView: ConfirmationView = ConfirmationView(state: .loading)

    init(presenter: ConfirmationPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        confirmationView.delegate = self
    }

    override func loadView() {
        self.view = self.confirmationView
    }
}

extension ConfirmationViewController: ConfirmationPresenterDelegate {

    func showData(confirmation: ConfirmationEntity) {
        confirmationView.state = .loaded(confirmation)
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {
    func didTapConfirmation() {
        dismiss(animated: true)
    }
}
