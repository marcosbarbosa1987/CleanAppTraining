//
//  SignUpFactory.swift
//  Main
//
//  Created by Marcos Barbosa on 29/05/21.
//

import Foundation
import UI
import Presentation
import Validation
import Data
import Infra

class SignUpFactory {
    static func makeController() -> SignUpViewController {
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdapter()
        let viewController =  SignUpViewController.instantiate()
        let emailValidatorAdapter = EmailValidatorAdapter()
        let remoteAddAccount = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let presenter = SignUpPresenter(alertView: viewController, emailValidator: emailValidatorAdapter, addAccount: remoteAddAccount, loadingView: viewController)
        viewController.signUp = presenter.signUp
        
        return viewController
    }
}
