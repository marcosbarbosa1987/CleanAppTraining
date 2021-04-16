//
//  TestsFactories.swift
//  DataTests
//
//  Created by Marcos Barbosa on 15/04/21.
//

import Foundation

func makeInvalidData() -> Data {
    return Data("invalid_data".utf8)
}

func makeUrl() -> URL {
    return URL(string: "http://any-url.com")!
}
