//
//  TransferRouter.swift
//  FinanceApp
//
import Foundation
import UIKit

class TransferRouter: TransferRouterProtocol {
    
    let viewController: TransfersViewController?

    init(viewController: TransfersViewController) {
        self.viewController = viewController
    }
    
    static func createModule() -> UINavigationController {

        let viewController = TransfersViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let presenter: TransferPresenterProtocol & TransferInteractorDelegate = TransferPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = TransferRouter(viewController: viewController)
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = TransferInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        return navigationController
    }
    
    func navigateToChooseContacts(controller: UIViewController) {
        present(controller: controller)
    }
    
    func navigateToTransfer(controller: UIViewController) {
        present(controller: controller)
    }
    
    private func present(controller: UIViewController) {
        self.viewController?.navigationController?.present(controller, animated: true)
    }
}

