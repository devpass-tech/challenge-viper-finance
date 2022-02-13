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

    private var transferValue: String = ""
	
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
	
	override func viewDidLoad() {
		super.viewDidLoad()
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
        let confirmation: ConfirmationEntity
        if transfer.success {
            confirmation = ConfirmationEntity(success: true, imageName: "checkmark.circle.fill", message: "Your transfer was successful")
        } else {
            confirmation = ConfirmationEntity(success: true, imageName: "x.circle.fill", message: "Something went wrong :(")
        }
        presenter.navigateToConfirmation(confirmation: confirmation)
    }

    func showError(error: Error) {
        //Show error in the controller
    }
}
