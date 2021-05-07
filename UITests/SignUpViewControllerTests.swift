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
    
    func test_save_button_calls_signup_on_tap() {
        var callsCount = 0
        let signUpSpy: ((SignUpViewModel) -> Void) = { _ in
            callsCount += 1
        }
        let sut = makeSUT(signUpSpy: signUpSpy)
       
        sut.saveButton?.simulateTap()
        XCTAssertEqual(callsCount, 1)
    }
}

// MARK: - Helper

extension SignUpViewControllerTests {
    
    func makeSUT(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sb = UIStoryboard(name: "SignUp", bundle: Bundle(for: SignUpViewController.self))
        let sut = sb.instantiateViewController(identifier: "SignUpViewController") as! SignUpViewController
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach{ action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
    
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
