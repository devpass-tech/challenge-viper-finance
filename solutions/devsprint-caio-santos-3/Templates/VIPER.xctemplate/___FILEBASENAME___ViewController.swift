import SomaiOS
import UIKit

final class ___VARIABLE_moduleName___ViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: ___VARIABLE_moduleName___PresenterInputProtocol

    // MARK: - Internal Properties

    // MARK: - Private Properties

    private let eventTracker: ___VARIABLE_moduleName___ViewEventTracking

    // MARK: - Inits
    
    init(
        presenter: ___VARIABLE_moduleName___PresenterInputProtocol,
        eventTracker: ___VARIABLE_moduleName___ViewEventTracking
    ) {
        self.presenter = presenter
        self.eventTracker = eventTracker
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        eventTracker.trackScreenView()
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods
    
    // MARK: - Actions
}

// MARK: - View Code
extension ___VARIABLE_moduleName___ViewController: SomaViewCode {
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfiguration() {
        
    }
}

// MARK: - Presenter Output Protocol
extension ___VARIABLE_moduleName___ViewController: ___VARIABLE_moduleName___PresenterOutputProtocol {

}
