//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

struct ActivityDetailsViewModel {
    var activityName: String
    var category: String
    var price: String
    var time: String
    var image: UIImage?
}

final class ActivityDetailsViewController: UIViewController {
    
    var presenter: ActivityDetailsPresenterProtocol?
    
    override func loadView() {
        self.view = ActivityDetailsView()
    }
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    
    func update(viewModel: ActivityDetailsViewModel) {
        (self.view as? ActivityDetailsView)?.update(viewModel: viewModel)
    }
}
