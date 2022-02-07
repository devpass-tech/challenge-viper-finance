//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation

protocol ConfirmationInteractorDelegate: AnyObject {
    func didFetchData(confirmation: ConfirmationEntity)
}

final class ConfirmationInteractor: ConfirmationInteractorProtocol {
    weak var presenter: ConfirmationInteractorDelegate?

    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            let confirmation = ConfirmationEntity(success: true, imageName: "checkmark.circle.fill", message: "Your transfer was successful")
            self.presenter?.didFetchData(confirmation: confirmation)
        }
    }
}
