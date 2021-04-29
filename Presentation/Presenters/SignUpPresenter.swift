//
//  SignUpPresenter.swift
//  Presentation
//
//  Created by Marcos Barbosa on 28/04/21.
//

import Foundation

public class SignUpPresenter {
    
    private let alertView: AlertView
    private var emailValidator: EmailValidator
    
    public init(alertView: AlertView, emailValidator: EmailValidator) {
        self.emailValidator = emailValidator
        self.alertView = alertView
    }
    
    public func signUp(viewModel: SignUpViewModel) {
        if let message = validate(viewModel: viewModel) {
            alertView.showMessage(viewModel: AlertViewModel(title: "Falha na validação", message: message))
        } else {
            // MARK: - Calls addAccount
        }
    }
    
    private func validate(viewModel: SignUpViewModel) -> String? {
        if viewModel.name == nil || (viewModel.name ?? "").isEmpty {
            return "O campo Nome é obrigatório"
        } else if viewModel.email == nil || (viewModel.email ?? "").isEmpty {
            return "O campo Email é obrigatório"
        } else if viewModel.password == nil || (viewModel.password ?? "").isEmpty {
            return "O campo Senha é obrigatório"
        } else if viewModel.passwordConfirmation == nil || (viewModel.passwordConfirmation ?? "").isEmpty {
            return "O campo Confirmação de Senha é obrigatório"
        } else if viewModel.password != viewModel.passwordConfirmation {
            return "Falha ao confirmar senha"
        } else if !(emailValidator.isValid(email: viewModel.email!)) {
            return "Email inválido"
        }
        return nil
    }
}

public struct SignUpViewModel {
    public var name: String?
    public var email: String?
    public var password: String?
    public var passwordConfirmation: String?
    
    public init(name: String? = nil, email: String? = nil, password: String? = nil, passwordConfirmation: String? = nil) {
        self.name = name
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}
