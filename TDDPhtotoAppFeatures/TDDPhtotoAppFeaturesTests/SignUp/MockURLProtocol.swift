//
//  MockURLProtocol.swift
//  TDDPhtotoAppFeaturesTests
//
//  Created by Anton Veldanov on 6/22/21.
//

import Foundation

class MockURLProtocol: URLProtocol{
    
    static var stubResponseData: Data?
    
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
    
}
