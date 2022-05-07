//
//  UIViewController+Extension.swift
//  FinanceApp
//
//  Created by pedro tres on 02/05/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
