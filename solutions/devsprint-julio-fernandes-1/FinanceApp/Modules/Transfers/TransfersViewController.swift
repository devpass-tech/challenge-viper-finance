//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

final class TransfersViewController: UIViewController {
	
	private var presenter: TransfersPresenterProtocol
	
	private lazy var transferView: TransfersView = {
		
		let transferView = TransfersView()
		transferView.delegate = self
		return transferView
	}()

    private(set) var transferValue: String = ""
	
	// MARK: - Init
	
	init(presenter: TransfersPresenterProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = transferView
	}
	
}

extension TransfersViewController: TransferViewDelegate {
	
	func didPressChooseContactButton() {
		presenter.navigateToContactList()
	}
	
	func didPressTransferButton() {
        presenter.didTapTransfer(value: transferValue)
	}

    func didAmountChange(value: String) {
        transferValue = value
    }
}

extension TransfersViewController: TransfersPresenterDelegate {
    func showData(transfer: TransfersEntity) {
        let imageName = transfer.success ? "checkmark.circle.fill" : "x.circle.fill"
        let message = transfer.success ? "Your transfer was successful" : "Something went wrong :("
        let confirmation = ConfirmationEntity(success: true, imageName: imageName, message: message)
        presenter.navigateToConfirmation(confirmation: confirmation)
    }
}
