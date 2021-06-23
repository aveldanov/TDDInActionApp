//
//  SignUpWebService.swift
//  TDDPhtotoAppFeatures
//
//  Created by Anton Veldanov on 6/20/21.
//

import Foundation



class SignUpWebService{
    //mocking
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString: String, urlSession: URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession
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
        
        
        //GET
        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            //TODO handle error
            
            if let data = data {
                print("urlSession2", self.urlSession)

                let signUpResponseModel = try? JSONDecoder().decode(SignUpResponseModel.self, from: data)
                
                completion(signUpResponseModel, nil)
            }else{
                //TODO
            }
        }
        
        dataTask.resume()
        
    }
    
    
    
    
    
}
