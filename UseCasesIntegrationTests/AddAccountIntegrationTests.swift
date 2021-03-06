//
//  AddAccountIntegrationTests.swift
//  AddAccountIntegrationTests
//
//  Created by Marcos Barbosa on 21/04/21.
//

import XCTest
import Data
import Infra
import Domain

class AddAccountIntegrationTests: XCTestCase {

    func test_add_account() {
        let url = URL(string: "https://fordevs.herokuapp.com/api/signup")!
        let alamofireAdapter = AlamofireAdapter()
        let sut = RemoteAddAccount(url: url, httpClient: alamofireAdapter)
        let addAccountModel = AddAccountModel(name: "Marcos", email: "marcos5@me.com", password: "secret", passwordConfirmation: "secret")
        let exp = expectation(description: "waiting")
        
        sut.add(addAccountModel: addAccountModel) { (result) in
            
            switch result {
            case .failure:
                XCTFail("Expect success got \(result) instead")
                
            case .success(let account):
                XCTAssertNotNil(account?.accessToken)
                XCTAssertEqual(account?.name, addAccountModel.name)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 15)
    }
}
