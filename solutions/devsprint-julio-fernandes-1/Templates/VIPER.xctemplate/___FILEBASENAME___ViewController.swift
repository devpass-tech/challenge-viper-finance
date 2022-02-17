//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

final class ___VARIABLE_moduleName___ViewController: UIViewController {
    
    // MARK: - VIPER Properties
    
    private let presenter: ___VARIABLE_moduleName___PresenterInputProtocol

    // MARK: - Internal Properties

    // MARK: - Private Properties

    // MARK: - Inits
    
    init(presenter: ___VARIABLE_moduleName___PresenterInputProtocol) {
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
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear()
    }
    
    // MARK: - Internal Methods
    
    // MARK: - Private Methods

    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    // MARK: - Actions
}

// MARK: - View Code
extension ___VARIABLE_moduleName___ViewController {
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
