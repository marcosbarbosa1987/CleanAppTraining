//
//  ControllerFactory.swift
//  Main
//
//  Created by Marcos Barbosa on 29/05/21.
//

import Foundation
import UI
import Presentation
import Validation
import Domain

class ControllerFactory {
    static func makeSignUp(addAccount: AddAccount) -> SignUpViewController {
        let viewController =  SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let presenter = SignUpPresenter(alertView: viewController, emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: viewController)
        viewController.signUp = presenter.signUp
        
        return viewController
    }
}
