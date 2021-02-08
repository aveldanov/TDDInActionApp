//
//  SignUpFormModelValidatorTests.swift
//  TDDInActionAppTests
//
//  Created by Veldanov, Anton on 2/7/21.
//

import XCTest

@testable import TDDInActionApp

class SignUpFormModelValidatorTests: XCTestCase {

    var sut: SignUpFormModelValidator!
    
    override func setUpWithError() throws {
       sut = SignUpFormModelValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }


    
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        //Arrange
        //Act
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Anton")
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid should have returned True, but returned False")
        
    }
    
    
    func testSignUpFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        //Act
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "A")
        //Assert
        
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid should have returned False for names shorter than 2 chars")
        
    }
    
    func testSignUpFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "AntonAntonAntonAntonAntonAnton")
        
        //Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid should have returned False for names longer than 10 chars")
        
    }
    
    
    
    // MARK: Last Name Validation Unit Tests
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Veldanov")
        
        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "V")
        
        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignUpConstants.lastNameMinLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        
        let isLastNameValid = sut.isLastNameValid(lastName: "VeldanovVeldanov")
        
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignUpConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Email Address Validation
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test.com")
        
        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
        
        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
    }
    
    

}
