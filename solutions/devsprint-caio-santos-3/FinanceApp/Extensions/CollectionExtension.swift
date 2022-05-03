//
//  CollectionExtension.swift
//  FinanceApp
//
//  Created by pedro tres on 02/05/22.
//

extension Collection where Indices.Iterator.Element == Index {
   public subscript(safe index: Index) -> Iterator.Element? {
     return (startIndex <= index && index < endIndex) ? self[index] : nil
   }
}
