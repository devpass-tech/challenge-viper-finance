//
//  TransfersPresenter.swift
//  FinanceApp
//
//  Created by Elena Diniz on 4/26/22.
//

import Foundation

protocol TransfersPresenting {
    func chooseNavigateToContactList()
    func chooseTransferMoney()
}

class TransfersPresenter: NSObject {
    
    private let interactor: TransfersInteractoring
    private let router: TransfersRoutering
    weak var controller: TransfersControlling?
    
    init(interactor: TransfersInteractoring = TransfersInteractor(),
         router: TransfersRoutering = TransfersRouter()) {
        self.interactor = interactor
        self.router = router
    }
}

extension TransfersPresenter: TransfersPresenting {
    func chooseNavigateToContactList() {
        router.perform(action: .openContactScreen)
    }
    
    func chooseTransferMoney() {
        router.perform(action: .clickedTransferButton)
    }
}
