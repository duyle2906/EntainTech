//
//  ApiError.swift
//  DomainLayer
//
//  Created by Duy Le on 19/6/2024.
//

import Foundation

public struct ApiError: Error, Decodable {
    public let statusCode: Int!
    public let errorCode: String
    public let message: String
    
    public init(statusCode: Int = 0, errorCode: String, message: String) {
        self.statusCode = statusCode
        self.errorCode = errorCode
        self.message = message
    }
    
    public static func unknownError(statusCode: Int = 0) -> Self {
        return ApiError(errorCode: "Error-0000", message: "Unknown API error")
    }
}
