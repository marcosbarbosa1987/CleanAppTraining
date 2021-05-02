//
//  AccountModelFactory.swift
//  DataTests
//
//  Created by Marcos Barbosa on 15/04/21.
//

import Foundation
import Domain

public func makeAddAccountModel() -> AddAccountModel {
    return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
}
