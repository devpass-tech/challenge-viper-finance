//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//
import UIKit

final class ActivityDetailsViewController: UIViewController {

    var presenter: ActivityDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func loadView() {
        self.view = ActivityDetailsView()
    }
}

extension ActivityDetailsViewController: ActivityDetailsPresenterDelegate {
    
    func showData() {
        
        print("Here is your data, View!")
    }
}
