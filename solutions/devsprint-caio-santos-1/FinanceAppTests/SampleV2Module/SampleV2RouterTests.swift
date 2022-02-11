//
//  SampleV2RouterTests.swift
//  FinanceAppTests
//
//  Created by Caio Santos on 10/02/22.
//

import XCTest
@testable import FinanceApp

final class SampleV2RouterTests: XCTestCase {
        
    private let sut = SampleV2Router()
    
    private var viewController: UserProfileViewController?
    private var navigationController: UINavigationController?

    override func setUp() {
        viewController = UserProfileViewController()
        
        guard let viewController = viewController else {
            return XCTFail("Unexpected nil in viewController reference")
        }
        
        navigationController = UINavigationController(rootViewController: viewController)
    }

    func test_CallNavigateToViewXPTO_ShouldPushNewView() {
        sut.viewController = viewController
        sut.navigateToViewXPTO()
        RunLoop.current.run(until: Date() + 0.01)
        XCTAssertEqual(sut.viewController?.navigationController?.viewControllers.count, 2)
        XCTAssertTrue(sut.viewController?.navigationController?.viewControllers.last is SampleViewController)
    }
}
