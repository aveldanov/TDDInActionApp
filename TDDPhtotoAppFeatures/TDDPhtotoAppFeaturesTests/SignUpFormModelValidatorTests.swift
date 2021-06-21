//
//  SignUpFormModelValidatorTests.swift
//  TDDPhtotoAppFeaturesTests
//
//  Created by Anton Veldanov on 6/20/21.
//

import XCTest

@testable import TDDPhtotoAppFeatures

class SignUpFormModelValidatorTests: XCTestCase {

    var sut: SignUpFormModelValidator!

    
    override func setUpWithError() throws {
        sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func testSignUpModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        //Arrange
        
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"Anton")
        
        //Assert
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValis() should have returned True, but returned False")
        
    }
    
    
    func testSignUpModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange

        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "e")
        
        //Assert
        
        XCTAssertFalse(isFirstNameValid,"The firstNameValid() should return false when too short")
        
    }



}
