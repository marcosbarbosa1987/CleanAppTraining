//
//  EmailValidator.swift
//  Presentation
//
//  Created by Marcos Barbosa on 28/04/21.
//

import Foundation

public protocol EmailValidator {
    func isValid(email: String) -> Bool
}
