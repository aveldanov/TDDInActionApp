//
//  SignUpWebService.swift
//  TDDPhtotoAppFeatures
//
//  Created by Anton Veldanov on 6/20/21.
//

import Foundation



class SignUpWebService{

    private var urlString: String
    
    init(urlString: String){
        self.urlString = urlString
    }
    
    
    func signUp(withForm formModel: SignUpFormRequestModel, completion: @escaping (SignUpResponseModel?, SignUpErrors?)->()){
        
        guard let url = URL(string: urlString) else{
            // TODO create a unit test
            return
        }
        //POST
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept") //accept json doc
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
    }

    
    
    
    
}
