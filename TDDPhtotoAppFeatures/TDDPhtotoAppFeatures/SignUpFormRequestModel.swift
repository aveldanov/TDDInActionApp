//
//  SignUpFormRequestModel.swift
//  TDDPhtotoAppFeatures
//
//  Created by Anton Veldanov on 6/20/21.
//

import Foundation


struct SignUpFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
