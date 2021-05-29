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
        var signUpViewModel: SignUpViewModel?
        let signUpSpy: ((SignUpViewModel) -> Void) = { signUpViewModel = $0 }
        let sut = makeSUT(signUpSpy: signUpSpy)
       
        let name = sut.nameTextField?.text
        let email = sut.emailTextField?.text
        let password = sut.passwordTextField?.text
        let confirmationPassword = sut.confirmationPasswordTextField?.text
        
        sut.saveButton?.simulateTap()
        XCTAssertEqual(signUpViewModel, SignUpViewModel(name: name, email: email, password: password, passwordConfirmation: confirmationPassword))
    }
}

// MARK: - Helper

extension SignUpViewControllerTests {
    
    func makeSUT(signUpSpy: ((SignUpViewModel) -> Void)? = nil) -> SignUpViewController {
        let sut = SignUpViewController.instantiate()
        sut.signUp = signUpSpy
        sut.loadViewIfNeeded()
        return sut
    }
}
