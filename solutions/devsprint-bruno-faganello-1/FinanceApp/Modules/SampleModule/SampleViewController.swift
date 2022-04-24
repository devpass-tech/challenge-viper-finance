//
//  SampleViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

class SampleViewController: UIViewController {

    var presenter: SamplePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func loadView() {
        self.view = SampleView()
    }
}

extension SampleViewController: SamplePresenterDelegate {

    func showData() {

        print("Here is your data, View!")
    }
}


