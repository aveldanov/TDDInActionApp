//
//  SignUpFormModelValidator.swift
//  TDDInActionApp
//
//  Created by Veldanov, Anton on 2/7/21.
//

import Foundation


class SignUpFormModelValidator{
    
    func isFirstNameValid(firstName: String)->Bool{
        var returnValue = true
        if firstName.isEmpty{
            returnValue = false
        }
        
        return returnValue
        
    }
    
    
}
