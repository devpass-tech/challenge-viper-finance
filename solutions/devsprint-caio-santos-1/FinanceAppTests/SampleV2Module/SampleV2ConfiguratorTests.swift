//
//  SampleV2ConfiguratorTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 09/02/22.
//

import XCTest
@testable import FinanceApp

final class SampleV2ConfiguratorTests: XCTestCase {
        
    private let sut = SampleV2Configurator()

    func test_create_module() {
        let transporter = SampleV2Transporter(value1: "", value2: "")
        let viewController = sut.createModule(transporter: Transporter(data: transporter))
        
        XCTAssertTrue(viewController is SampleV2ViewController)
        let viewControllerMirrored = Mirror(reflecting: viewController)
        guard let presenter = viewControllerMirrored.firstChild(of: SampleV2Presenter.self) else {
            return XCTFail("Unexpected nil in presenter reference")
        }
        let presenterMirrored = Mirror(reflecting: presenter)
        XCTAssertNotNil(presenterMirrored.firstChild(of: SampleV2RouterProtocol.self))
        XCTAssertNotNil(presenter.viewController)
    }
}

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
