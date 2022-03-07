//
//  SampleV2Presenter.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

final class SampleV2Presenter {
    
    // MARK: - Viper Properties
    
    weak var viewController: SampleV2PresenterOutputProtocol?
    private let router: SampleV2RouterProtocol
    private let interactor: SampleV2InteractorInputProtocol
    
    // MARK: - Internal Properties
    
    private var transporter: SampleV2Transporter?
    private var sampleEntity: SampleEntity?

    // MARK: - Private Properties
    
    // MARK: - Inits
    
    init(router: SampleV2RouterProtocol,
         interactor: SampleV2InteractorInputProtocol,
         transporter: Transporter<Any>?) {
        self.router = router
        self.interactor = interactor
        self.transporter = transporter?.data as? SampleV2Transporter
    }
    
    // MARK: - Internal Methods
        
    // MARK: - Private Methods    
}

// MARK: - Input Protocol
extension SampleV2Presenter: SampleV2PresenterInputProtocol {
    func navigateToViewXPTO() {
        router.navigateToViewXPTO()
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return 1
    }
    
    func getCellType(at indexPath: IndexPath) -> SampleV2CellType? {
        return .cell1
    }
    
    func getTextForCell(at indexPath: IndexPath) -> String {
        guard let sampleEntity = sampleEntity else { return "NENHUM TEXTO" }
        
        return "\(sampleEntity.title) - \(sampleEntity.description)"
    }
    
    func viewDidAppear() {
        trackScreenView()
        viewController?.presentLoadingState()
        interactor.loadSampleData()
    }
}

// MARK: - Output Protocol
extension SampleV2Presenter: SampleV2InteractorOutputProtocol {
    func didLoadSampleData(entity: SampleEntity) {
        sampleEntity = entity
        viewController?.presentEntityData()
    }
    
    func didErrorOnLoadSampleData() {
        viewController?.presentErrorState()
    }
}

// MARK: - Analytics
extension SampleV2Presenter {
    func trackScreenView() {
        // TODO: CALL YOUR OWN VIEW TRACKER
    }
}
