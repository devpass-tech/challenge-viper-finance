//
//  Mirror+Extensoins.swift
//  FinanceApp
//
//  Created by Caio Santos on 10/02/22.
//

extension Mirror {
    public func firstChild<T>(of _: T.Type, in label: String? = nil) -> T? {
        children.lazy.compactMap {
            guard let value = $0.value as? T else { return nil }
            guard let label = label else { return value }
            return $0.label == label ? value : nil
        }.first
    }
    
    public func firstLazyChild<T>(of _: T.Type, in label: String? = nil) -> T? {
        children.lazy.compactMap {
            guard let value = $0.value as? T else { return nil }
            guard let label = label else { return value }
            return $0.label == "$__lazy_storage_$_\(label)" ? value : nil
        }.first
    }
}
