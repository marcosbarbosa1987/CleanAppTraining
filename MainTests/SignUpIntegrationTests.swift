//
//  SignUpIntegrationTests.swift
//  MainTests
//
//  Created by Marcos Barbosa on 29/05/21.
//

import XCTest
import Main

class SignUpIntegrationTests: XCTestCase {

    func test_ui_presentation_integration() {
        let sut = SignUpComposer.composeController(with: AddAccountSpy())
        checkMemoryLeak(for: sut)
    }
}
