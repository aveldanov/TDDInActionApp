//
//  SignUpErrors.swift
//  TDDPhtotoAppFeatures
//
//  Created by Anton Veldanov on 6/20/21.
//

import Foundation


enum SignupError: LocalizedError, Equatable {
    
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
    
}
