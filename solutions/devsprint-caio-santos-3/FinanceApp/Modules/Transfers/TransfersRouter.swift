//
//  TransfersRouter.swift
//  FinanceApp
//
//  Created by Elena Diniz on 4/26/22.
//

import UIKit

enum TransfersFactory {
    static func make() -> TransfersControlling {
        let router = TransfersRouter()
        let interactor = TransfersInteractor()
        let presenter = TransfersPresenter(interactor: interactor,
                                           router: router)
        let controller = TransfersViewController(presenter: presenter)
        router.controller = controller
        return controller
    }
}


enum TransfersActions {
    case openContactScreen
    case clickedTransferButton
}

protocol TransfersRoutering {
    func perform(action: TransfersActions)
}

class TransfersRouter {
    weak var controller: TransfersControlling?
}

extension TransfersRouter: TransfersRoutering {
    func perform(action: TransfersActions) {
        switch action {
        case .clickedTransferButton:
            didPressTransferButton()
        case .openContactScreen:
            didPressChooseContactButton()
        }
    }
}

private extension TransfersRouter {
    func didPressChooseContactButton() {
        let vc =  ContactListViewController()
        controller?.present(vc, animated: true)
    }

    func didPressTransferButton() {
        let vc =  ConfirmationViewController()
        controller?.present(vc, animated: true)
    }
}
