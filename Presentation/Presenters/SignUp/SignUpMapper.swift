//
//  SignUpMapper.swift
//  Presentation
//
//  Created by Marcos Barbosa on 03/05/21.
//

import Foundation
import Domain

public final class SignUpMapper {
    
    static func toAddAccountModel(viewModel: SignUpViewModel) -> AddAccountModel {
        return AddAccountModel(name: viewModel.name!, email: viewModel.email!, password: viewModel.password!, passwordConfirmation: viewModel.passwordConfirmation!)
    }
}
