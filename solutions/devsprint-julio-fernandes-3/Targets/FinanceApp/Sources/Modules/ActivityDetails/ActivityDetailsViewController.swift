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
    private var activityDetailsView: ActivityDetailsViewProtocol
    
    init(activityDetailsView: ActivityDetailsViewProtocol) {
        self.activityDetailsView = activityDetailsView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func loadView() {
        activityDetailsView.delegate = self
        self.view = activityDetailsView as? UIView
    }
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    
    func update(viewModel: ActivityDetailsViewModel) {
        activityDetailsView.update(viewModel: viewModel)
    }
}

extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    
    func didPressReportIssueButton() {
        presenter?.presentReportIssue()
    }
}
