//
//  RemoteAddAccountTests.swift
//  DataTests
//
//  Created by Marcos Barbosa on 09/04/21.
//

import XCTest
import Domain
import Data

class RemoteAddAccountTests: XCTestCase {

    func test_add_should_call_httpClient_with_correct_url() {
        let url = URL(string: "http://any-url.com")!
        let (sut, httpClientSpy) = makeSUT(url: url)
        sut.add(addAccountModel: makeAddAccountModel()) { _ in }
        XCTAssertEqual(httpClientSpy.urls, [url])
    }
    
    func test_add_should_call_httpClient_with_correct_data() {
        let (sut, httpClientSpy) = makeSUT()
        let addAccountModel = makeAddAccountModel()
        sut.add(addAccountModel: addAccountModel) { _ in }
        XCTAssertEqual(httpClientSpy.data, addAccountModel.toData())
    }
    
    func test_add_should_complete_with_error_if_client_completes_with_error() {
        let (sut, httpClientSpy) = makeSUT()
        let exp = expectation(description: "waiting")
        sut.add(addAccountModel: makeAddAccountModel()) { result in
            
            switch result {
            case .success:
                XCTFail("Expected error receive \(result) instead")
            case .failure(let error):
                XCTAssertEqual(error, .unexpected)
            }
            
            exp.fulfill()
        }
        httpClientSpy.completeWithError(.noConnectivity)
        wait(for: [exp], timeout: 1)
    }
    
//    func test_add_should_complete_with_account_if_client_completes_with_data() {
//        let (sut, httpClientSpy) = makeSUT()
//        let exp = expectation(description: "waiting")
//        sut.add(addAccountModel: makeAddAccountModel()) { error in
//            XCTAssertEqual(error, .unexpected)
//            exp.fulfill()
//        }
//        httpClientSpy.completeWithError(.noConnectivity)
//        wait(for: [exp], timeout: 1)
//    }
}

// MARK: - Helpers

extension RemoteAddAccountTests {
    
    func makeSUT(url: URL = URL(string: "http://any-url.com")!) -> (sut: RemoteAddAccount, HttpClientSpy: HttpClientSpy) {
        let httpClientSpy = HttpClientSpy()
        let sut = RemoteAddAccount(url: url, httpClient: httpClientSpy)
        return (sut, httpClientSpy)
    }
    
    func makeAddAccountModel() -> AddAccountModel {
        return AddAccountModel(name: "any_name", email: "any_email@mail.com", password: "any_password", passwordConfirmation: "any_password")
    }
    
    class HttpClientSpy: HttpPostClient {
        var urls: [URL] = [URL]()
        var data: Data?
        var completion: ((Result<Data?, HttpError>) -> Void)?
        
        func post(to url: URL, with data: Data?, completion: @escaping(Result<Data?, HttpError>) -> Void) {
            self.urls.append(url)
            self.data = data
            self.completion = completion
        }
        
        func completeWithError(_ error: HttpError) {
            completion?(.failure(error))
        }
    }
}
