protocol TransferInteractorDelegate: AnyObject {
}

class TransferInteractor: TransferInteractorProtocol {

    weak var presenter: TransferInteractorDelegate?
}
