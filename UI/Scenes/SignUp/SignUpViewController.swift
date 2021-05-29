//
//  SignUpViewController.swift
//  UI
//
//  Created by Marcos Barbosa on 04/05/21.
//

import Foundation
import UIKit
import Presentation

final class SignUpViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    var signUp: ((SignUpViewModel) -> Void)?
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Private methods
    
    private func configure() {
        saveButton?.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        signUp?(SignUpViewModel(name: nameTextField?.text,
                                email: emailTextField?.text,
                                password: passwordTextField?.text,
                                passwordConfirmation: confirmationPasswordTextField?.text))
    }
}

// MARK: - LoadingView

extension SignUpViewController: LoadingView {

    func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            loadingIndicator?.startAnimating()
        } else {
            loadingIndicator?.stopAnimating()
        }
    }
}

// MARK: - AlertView

extension SignUpViewController: AlertView {
   
    func showMessage(viewModel: AlertViewModel) {
        
    }
}
