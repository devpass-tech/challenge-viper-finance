//
//  SampleV2Protocols.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

// MARK: - ViewController
protocol SampleV2PresenterOutputProtocol: AnyObject {
    func presentEntityData()
    func presentErrorState()
    func presentLoadingState()
}

// MARK: - Presenter
protocol SampleV2PresenterInputProtocol: AnyObject {
    func viewDidAppear()
    
    // Tableview configuration
    func numberOfSections() -> Int
    func numberOfRows(at section: Int) -> Int
    func getCellType(at indexPath: IndexPath) -> SampleV2CellType?

    // Tableview data
    func getTextForCell(at indexPath: IndexPath) -> String
    
    // View Actions
    func navigateToViewXPTO()
}

// MARK: - Interactor
protocol SampleV2InteractorInputProtocol: AnyObject {
    func loadSampleData()
}

protocol SampleV2InteractorOutputProtocol: AnyObject {
    func didLoadSampleData(entity: SampleEntity)
    func didErrorOnLoadSampleData()
}

// MARK: - Router
protocol SampleV2RouterProtocol: AnyObject {
    func navigateToViewXPTO()
}
