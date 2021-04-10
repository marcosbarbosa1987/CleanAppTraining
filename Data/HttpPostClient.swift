//
//  HttpPostClient.swift
//  Data
//
//  Created by Marcos Barbosa on 10/04/21.
//

import Foundation

public protocol HttpPostClient {
    func post(to url: URL, with data: Data?)
}