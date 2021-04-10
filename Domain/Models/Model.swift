//
//  Model.swift
//  Domain
//
//  Created by Marcos Barbosa on 10/04/21.
//

import Foundation

public protocol Model: Encodable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
