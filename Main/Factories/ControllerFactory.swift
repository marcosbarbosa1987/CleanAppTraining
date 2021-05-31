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
        let presenter = SignUpPresenter(alertView: WeakVarProxy(viewController), emailValidator: emailValidatorAdapter, addAccount: addAccount, loadingView: WeakVarProxy(viewController))
        viewController.signUp = presenter.signUp
        
        return viewController
    }
}

class WeakVarProxy<T: AnyObject> {
    private weak var instance: T?
    
    init(_ instance: T) {
        self.instance = instance
    }
}

extension WeakVarProxy: AlertView where T: AlertView {
    func showMessage(viewModel: AlertViewModel) {
        instance?.showMessage(viewModel: viewModel)
    }
}

extension WeakVarProxy: LoadingView where T: LoadingView {
    func display(viewModel: LoadingViewModel) {
        instance?.display(viewModel: viewModel)
    }
}
