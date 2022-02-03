//
//  ConfirmationInteractor.swift
//  FinanceApp
//
//  Created by Lucas Eduardo Schlogl on 01/02/22.
//

import Foundation
import UIKit

protocol ConfirmationInteractorDelegate: AnyObject {
    func didFetchData(confirmation: Confirmation)
}

final class ConfirmationInteractor: ConfirmationInteractorProtocol {
    weak var presenter: ConfirmationInteractorDelegate?

    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            guard let self = self else { return }
            let confirmation = Confirmation(success: true, image: UIImage(named: "checkmark.circle.fill"), message: "Your transfer was successful")
            self.presenter?.didFetchData(confirmation: confirmation)
        }
    }
}
