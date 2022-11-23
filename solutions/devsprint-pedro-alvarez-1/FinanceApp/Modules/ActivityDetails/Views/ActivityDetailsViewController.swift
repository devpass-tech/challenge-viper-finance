//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class ActivityDetailsViewController: UIViewController {
    private let presenter: ActivityDetailsPresenterIntput
    lazy var rootView = ActivityDetailsView()
    
    init(presenter: ActivityDetailsPresenterIntput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = rootView
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterOutput {
    func updateView() {
        DispatchQueue.main.async {
            self.rootView.setup(self.presenter.viewModel)
        }
    }
}
