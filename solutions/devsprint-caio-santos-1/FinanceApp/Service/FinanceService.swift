//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

protocol FinanceServiceProtocol: AnyObject {

    func fetchHomeData()
    func readLocalFile(forName name: String) -> Data?
}

final class FinanceService: FinanceServiceProtocol {

    func fetchHomeData() {}

    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath: String = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData: Data = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
