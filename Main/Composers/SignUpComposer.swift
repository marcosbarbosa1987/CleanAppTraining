//
//  SignUpComposer.swift
//  Main
//
//  Created by Marcos Barbosa on 30/05/21.
//

import Foundation
import Domain
import UI

public final class SignUpComposer {
    static func composeController(with addAccount: AddAccount) -> SignUpViewController {
        return ControllerFactory.makeSignUp(addAccount: addAccount)
    }
}
