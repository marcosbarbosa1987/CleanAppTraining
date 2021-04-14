//
//  ExtensionHelpers.swift
//  Data
//
//  Created by Marcos Barbosa on 13/04/21.
//

import Foundation

public extension Data {
    func toModel<T: Decodable>() -> T? {
        return try? JSONDecoder().decode(T.self, from: self)
    }
}
