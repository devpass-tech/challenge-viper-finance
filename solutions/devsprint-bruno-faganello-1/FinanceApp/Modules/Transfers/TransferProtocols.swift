import Foundation
import UIKit

protocol TransferPresenterProtocol {

    var view: TransferPresenterDelegate? { get set }
    var interactor: TransferInteractorProtocol? { get set }
    var router: TransferRouterProtocol? { get set }

    func didPressChooseContactButton()
    func didPressTransferButton()
}

protocol TransferRouterProtocol {
    static func createModule() -> UINavigationController
    func navigateToChooseContacts()
    func navigateToTransfer()
}

protocol TransferInteractorProtocol {

    var presenter: TransferInteractorDelegate? { get set }
}
