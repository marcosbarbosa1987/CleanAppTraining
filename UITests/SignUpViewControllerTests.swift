//
//  SignUpViewControllerTests.swift
//  UITests
//
//  Created by Marcos Barbosa on 04/05/21.
//

import XCTest
import UIKit
import Presentation
@testable import UI

class SignUpViewControllerTests: XCTestCase {
    
    func test_loading_is_hidden_on_start() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.loadingIndicator?.isAnimating, false)
    }
    
    func test_sut_implements_loadingView() {
        let sut = makeSUT()
        XCTAssertNotNil(sut as LoadingView)
    }
    
    func test_sut_implements_alertView() {
        let sut = makeSUT()
        XCTAssertNotNil(sut as AlertView)
    }
}

// MARK: - Helper

extension SignUpViewControllerTests {
    
    func makeSUT() -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.loadViewIfNeeded()
        return sut
    }
}
