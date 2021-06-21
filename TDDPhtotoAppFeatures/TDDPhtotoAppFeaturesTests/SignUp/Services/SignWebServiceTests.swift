//
//  SignWebServiceTests.swift
//  TDDPhtotoAppFeaturesTests
//
//  Created by Anton Veldanov on 6/20/21.
//

import XCTest

@testable import TDDPhtotoAppFeatures

class SignWebServiceTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnsSuccess(){
        //Arrange
        let sut = SignUpWebService()
        
        let signUpFormRequestModel = SignUpFormRequestModel(firstName: "Anton", lastName: "Vel", email: "test@test.com", password: "12345678")
        
        sut.signUp(withForm: signUpFormRequestModel){(signUpResponseModel, error) in }
        
        
        //Act
        
        
        //Assert
        
        
        
        
    }
    
    
}
