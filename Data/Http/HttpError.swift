//
//  HttpError.swift
//  Data
//
//  Created by Marcos Barbosa on 13/04/21.
//

import Foundation

public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
