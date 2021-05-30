//
//  SignUpViewController.swift
//  UI
//
//  Created by Marcos Barbosa on 04/05/21.
//

import Foundation
import UIKit
import Presentation

public final class SignUpViewController: UIViewController, Storyboarded {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmationPasswordTextField: UITextField!
    
    public var signUp: ((SignUpViewModel) -> Void)?
    
    // MARK: - Overrides
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Private methods
    
    private func configure() {
        saveButton?.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.layer.cornerRadius = 8
        hideKeyboardOnTap()
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

    public func display(viewModel: LoadingViewModel) {
        if viewModel.isLoading {
            view.isUserInteractionEnabled = false
            loadingIndicator?.startAnimating()
        } else {
            view.isUserInteractionEnabled = true
            loadingIndicator?.stopAnimating()
        }
    }
}

// MARK: - AlertView

extension SignUpViewController: AlertView {
   
    public func showMessage(viewModel: AlertViewModel) {
        let alert = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
