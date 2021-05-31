//
//  UseCaseFactory.swift
//  Main
//
//  Created by Marcos Barbosa on 30/05/21.
//

import Foundation
import Data
import Infra
import Domain

final class UseCaseFactory {
    
    static func makeRemoteAddAccount() -> AddAccount {
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdapter()
        return RemoteAddAccount(url: url, httpClient: alamofireAdapter)
    }
}
