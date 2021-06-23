//
//  SignWebServiceTests.swift
//  TDDPhtotoAppFeaturesTests
//
//  Created by Anton Veldanov on 6/20/21.
//

import XCTest

@testable import TDDPhtotoAppFeatures

class SignWebServiceTests: XCTestCase {
    
    var sut: SignUpWebService!
    var signUpFormRequestModel: SignUpFormRequestModel!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignUpWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users", urlSession: urlSession)
         signUpFormRequestModel = SignUpFormRequestModel(firstName: "Anton", lastName: "Vel", email: "test@test.com", password: "12345678")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        signUpFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
//        MockURLProtocol.error = nil
    }
    
    
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess(){

        
        //MOCKING
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let urlSession = URLSession(configuration: config)
        
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8) //converted json to data assigned to stubData
        

        
        
        //Arrange
        
        // update plist to run not secured http
        
//        let sut = SignUpWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        //MOCKING
//         sut = SignUpWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users", urlSession: urlSession)
        //END MOCKING
        
        
//        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Anton", lastName: "Vel", email: "test@test.com", password: "12345678")
        // async method to wait for completion
        let expectation = self.expectation(description: "Signup WebService Response wait expectation") //EXP1
        
        //Act
        sut.signUp(withForm: signUpFormRequestModel){(signUpResponseModel, error) in
            
            
            //Assert
            
//            let jsonString = "{\"status\":\"ok\"}"

            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill() //EXP3
        }
        
        
        self.wait(for: [expectation], timeout: 5) //EXP2
        
        

        
        
        
        
        
    }
    
    
}
