//
//  Transporter.swift
//  FinanceApp
//
//  Created by Caio Santos on 06/02/22.
//

import Foundation

public class Transporter<T> {
    public var data: T?
    
    public init(data: T?) {
        self.data = data
    }
}

