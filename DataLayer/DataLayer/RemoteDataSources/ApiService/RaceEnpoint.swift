//
//  RaceEnpoint.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

enum RaceEndpoint: EndpointProtocol {
    
    case getNextRaces(count: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getNextRaces:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getNextRaces:
            return "/rest/v1/racing"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .getNextRaces(let count):
            return [
                URLQueryItem(name: "method", value: "nextraces"),
                URLQueryItem(name: "count", value: "\(count)"),
            ]
        }
    }
    
    var token: String {
        return ""
    }
    
    var body: [String : Any]? {
        return nil
    }
    
    
}
