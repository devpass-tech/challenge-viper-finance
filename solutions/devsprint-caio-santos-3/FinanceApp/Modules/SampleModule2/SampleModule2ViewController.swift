import UIKit

final class SampleModule2ViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: SampleModule2PresenterInputProtocol

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits
    
    init(presenter: SampleModule2PresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    
    // MARK: - Actions
}

// MARK: - Presenter Output Protocol
extension SampleModule2ViewController: SampleModule2PresenterOutputProtocol {

}
