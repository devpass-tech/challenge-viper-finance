//
//  ConfirmationPresenter.swift
//  FinanceApp
//
//  Created by Hyago Henrique on 01/02/22.
//

import Foundation
import UIKit

protocol ConfirmationPresenterDelegate: AnyObject {
    
}

final class ConfirmationPresenter: ConfirmationPresenterProtocol {
    
    weak var view: ConfirmationPresenterDelegate?
    var interactor: ConfirmationInteractorProtocol?
    var router: ConfirmationRouterProtocol?
    var statusTransfer: Bool?
    
    func viewDidLoad() {
        //get data
    }
    
    func getText() -> String {
        statusTransfer ?? false ? "Your transfer was successful" : "Your transfer was failed"
    }
    
    func getColorIcon() -> UIColor {
        statusTransfer ?? false ? .systemGreen : .systemRed
    }
    
    func getButtonTitle() -> String {
        statusTransfer ?? false ? "Nice!" : "OK"
    }
   
}

extension ConfirmationPresenter: ConfirmationInteractorDelegate {
    
}
