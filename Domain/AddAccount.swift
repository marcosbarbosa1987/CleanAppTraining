//
//  AddAccount.swift
//  Domain
//
//  Created by Marcos Barbosa on 09/04/21.
//

import Foundation

public protocol AddAccount {
    func add(addAccountModel: AddAccountModel, completion: @escaping(Result<AccountModel, Error>) -> Void)
}

public struct AddAccountModel {
    public var name: String
    public var email: String
    public var password: String
    public var passwordConfirmation: String
}
