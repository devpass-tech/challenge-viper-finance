//
//  TransferRouter.swift
//  FinanceApp
//
import Foundation
import UIKit

class TransferRouter: TransferRouterProtocol {
    
  static func createModule() -> UINavigationController {

        let viewController = TransfersViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter: TransferPresenterProtocol & TransferInteractorDelegate = TransferPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = TransferRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransferInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToChooseContacts(controller: UIViewController) {
        let contactsController = ContactListViewController()
        controller.navigationController?.present(contactsController, animated: true)
    }
    
    func navigateToTransfer(controller: UIViewController) {
        let confirmationViewController = ConfirmationViewController()
        controller.navigationController?.present(confirmationViewController, animated: true)
    }

}

