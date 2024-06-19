//
//  EndpointProtocol.swift
//  DataLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public protocol EndpointProtocol {
    var method: HTTPMethod { get }
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var token: String { get }
    var body: [String: Any]? { get }
}

extension EndpointProtocol {
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "api.neds.com.au"
    }
        
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    func createRequest() throws -> URLRequest{
        guard let url = url else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "X-Use-Cache")
        
        if !token.isEmpty {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        }
        
        return request
    }
    
}
