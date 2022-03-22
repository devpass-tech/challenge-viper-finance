//
//  Collection+Extension.swift
//  FinanceApp
//
//  Created by Victor Catão on 21/03/22.
//

extension Collection where Indices.Iterator.Element == Index {
   public subscript(safe index: Index) -> Iterator.Element? {
     return (startIndex <= index && index < endIndex) ? self[index] : nil
   }
}
