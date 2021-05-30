//
//  EmailValidatorAdapterTests.swift
//  ValidationTests
//
//  Created by Marcos Barbosa on 29/05/21.
//

import XCTest
import Presentation
import Validation

class EmailValidatorAdapterTests: XCTestCase {

    func test_invalid_emails() {
        let sut = makeSut()
        XCTAssertFalse(sut.isValid(email: "rr"))
        XCTAssertFalse(sut.isValid(email: "rr@"))
        XCTAssertFalse(sut.isValid(email: "rr@rr"))
        XCTAssertFalse(sut.isValid(email: "rr@rr."))
        XCTAssertFalse(sut.isValid(email: "@rr.com"))
    }
    
    func test_valid_emails() {
        let sut = makeSut()
        XCTAssertTrue(sut.isValid(email: "rodrigo@gmail.com"))
        XCTAssertTrue(sut.isValid(email: "rodrigo@gmail.com.br"))
        XCTAssertTrue(sut.isValid(email: "rodrigo@hotmail.com"))
        XCTAssertTrue(sut.isValid(email: "rodrigo@hotmail.com.br"))
    }
}

extension EmailValidatorAdapterTests {
    func makeSut() -> EmailValidatorAdapter {
        return EmailValidatorAdapter()
    }
}
