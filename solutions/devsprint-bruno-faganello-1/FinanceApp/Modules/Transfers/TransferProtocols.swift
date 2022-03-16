import Foundation
import UIKit

protocol TransferPresenterProtocol {

    var view: TransferPresenterDelegate? { get set }
    var interactor: TransferInteractorProtocol? { get set }
    var router: TransferRouterProtocol? { get set }

    func didPressChooseContactButton(controller: UIViewController)
    func didPressTransferButton(controller: UIViewController)
}

protocol TransferRouterProtocol {
    static func createModule() -> UINavigationController
    func navigateToTransfer(controller: UIViewController)
    func navigateToChooseContacts(controller: UIViewController)
}

protocol TransferInteractorProtocol {

    var presenter: TransferInteractorDelegate? { get set }
}
