//
//  JsonLoader.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

public protocol JsonLoaderProtocol: AnyObject {
    func readLocalFile(forName name: String) -> Data?
}

public class JsonLoader: JsonLoaderProtocol {    
    public func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
            return nil
        }
        
        return nil
    }
}

