//
//  SignUpFormModelValidatorTests.swift
//  TDDInActionAppTests
//
//  Created by Veldanov, Anton on 2/7/21.
//

import XCTest

@testable import TDDInActionApp

class SignUpFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    
    func testSignUpFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        
        //Arrange
        let sut = SignUpFormModelValidator()
        //Act
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Anton")
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid should have returned True, but returned False")
        
    }

}
