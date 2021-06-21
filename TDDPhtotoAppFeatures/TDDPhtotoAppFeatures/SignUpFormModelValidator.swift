//
//  SignUpFormModelValidator.swift
//  TDDPhtotoAppFeatures
//
//  Created by Anton Veldanov on 6/20/21.
//

import Foundation

 //MARK: Validates Form input
class SignUpFormModelValidator {
    func isFirstNameValid(firstName:String)->Bool{
        var returnValue = true
        if firstName.count < 2{
            returnValue = false
        }
        return returnValue
    }
}
