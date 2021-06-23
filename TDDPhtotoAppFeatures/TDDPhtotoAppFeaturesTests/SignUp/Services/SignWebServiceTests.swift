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
        print("urlSession1", urlSession)
        sut = SignUpWebService(urlString: SignUpConstants.signupURLString, urlSession: urlSession)
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
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Arrange fake JSON
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData =  jsonString.data(using: .utf8)

        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")

        // Act
        sut.signUp(withForm: signUpFormRequestModel){(signUpResponseModel, error) in

            // Assert
            XCTAssertNil(signUpResponseModel, "The response model for a request containing unknown JSON response, should have been nil")
//            XCTAssertEqual(error, SignUpError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()

        }

        self.wait(for: [expectation], timeout: 5)
    }


    
    
}
