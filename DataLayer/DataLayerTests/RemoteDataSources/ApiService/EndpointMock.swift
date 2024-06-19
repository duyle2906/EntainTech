//
//  EndpointMock.swift
//  DataLayerTests
//
//  Created by Duy Le on 19/6/2024.
//

import XCTest
@testable import DataLayer

class EndpointMock: EndpointProtocol {
    
    var pathMock: String
    
    init(pathMock: String = "/rest/v1/racing") {
        self.pathMock = pathMock
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return pathMock
    }
    
    var queryItems: [URLQueryItem] {
        return []
    }
    
    var token: String {
        return ""
    }
    
    var body: [String : Any]? {
        return nil
    }
    
}

