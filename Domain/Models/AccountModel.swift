//
//  AccountModel.swift
//  Domain
//
//  Created by Marcos Barbosa on 09/04/21.
//

import Foundation

public struct AccountModel: Model {
    public var accessToken: String?
//    public var id: String
    public var name: String
//    public var email: String
//    public var password: String
    
    public init(name: String) {
//        self.id = id
        self.name = name
//        self.email = email
//        self.password = password
    }
}
