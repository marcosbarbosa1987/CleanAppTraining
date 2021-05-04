//
//  EmailValidatorSpy.swift
//  PresentationTests
//
//  Created by Marcos Barbosa on 04/05/21.
//

import Foundation
import Presentation

class EmailValidatorSpy: EmailValidator {
    
    private var isValid = true
    var email: String?
    
    func isValid(email: String) -> Bool {
        self.email = email
        return isValid
    }
    
    func simulateInvalidEmail() {
        self.isValid = false
    }
}
